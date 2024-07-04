from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
import logging
from django.core.mail import send_mail
from django.conf import settings
from django.http import HttpResponseServerError, HttpResponse
from .models import Room
from home.models import Message
from .models import Reservation, BathroomImage, MinibarImage
from .forms import ReservationForm, AvailabilityForm
from django.http import JsonResponse
from datetime import datetime
from django.utils.timezone import datetime, timedelta
from django.views.decorators.http import require_POST
from django.views.decorators.http import require_GET
from django.db.models import Q
from django.core import serializers
from decimal import Decimal


logger = logging.getLogger(__name__)


@login_required
def reserve_room(request, room_id):
    """
    Handles reservation of a room.

    Parameters:
    - request: HTTP request object containing metadata about the request.
    - room_id: ID of the room to be reserved.

    Returns:
    - JSON response with reservation details upon successful reservation.
    - JSON response with form errors if the form is not valid.
    """
    room = Room.objects.get(pk=room_id)

    if request.method == "POST":
        form = ReservationForm(request.POST)
        if form.is_valid():
            reservation = form.save(commit=False)
            reservation.room = room
            reservation.user = request.user
            reservation.first_name = request.user.first_name
            reservation.last_name = request.user.last_name
            reservation.name = request.user.first_name

            checkin_date = form.cleaned_data["checkin_date"]
            checkout_date = form.cleaned_data["checkout_date"]
            total_nights = (checkout_date - checkin_date).days

            price_per_night = room.price
            total_price = calculate_discounted_price(
                price_per_night, total_nights
            )

            reservation.total_price = total_price
            reservation.save()

            # Return success response with reservation details

            return JsonResponse(
                {
                    "room_number": room.room_number,
                    "room_type": room.room_type,
                    "checkin_date": reservation.checkin_date,
                    "checkout_date": reservation.checkout_date,
                    "total_price": reservation.total_price,
                    "name": reservation.name,
                }
            )
        else:
            # Form is not valid, handle the error scenario

            return JsonResponse({"error": form.errors}, status=400)
    else:
        initial_data = {
            "checkin_date": request.GET.get("check_in"),
            "checkout_date": request.GET.get("check_out"),
            "type_of_room": room.room_type,
        }
        form = ReservationForm(initial=initial_data)
    return render(
        request, "bookings/reservation.html", {"form": form, "room": room}
    )


def calculate_discounted_price(price_per_night, total_nights):
    """
    Calculates discounted price for a given number of nights.

    Parameters:
    - price_per_night: Price per night for the room.
    - total_nights: Total number of nights for the reservation.

    Returns:
    - Discounted total price for the reservation.
    """

    price_per_night_decimal = Decimal(str(price_per_night))
    total_nights_decimal = Decimal(str(total_nights))

    discounted_price = (
        price_per_night_decimal * total_nights_decimal * Decimal("0.9")
    )
    return discounted_price


def book_room(request):
    """
    Renders the book room page.
    """
    return render(request, "bookings/book_room.html")


def rooms_view(request):
    """
    Renders the rooms view page with room details.
    """
    room_type = request.GET.get("type")

    room_types = Room.objects.values_list("room_type", flat=True).distinct()
    if room_type:
        rooms = Room.objects.filter(room_type=room_type).order_by(
            "room_number"
        )
    else:
        rooms = Room.objects.all()
    context = {"rooms": rooms, "room_type": room_type}
    return render(request, "bookings/rooms.html", context)


@login_required
def check_availability(request, room_id):
    """
    Checks availability of a room for a given date range.

    Parameters:
    - request: HTTP request object containing metadata about the request.
    - room_id: ID of the room to check availability for.

    Returns:
    - JSON response indicating availability status and
       alternative rooms if not available.
    """
    room = get_object_or_404(Room, pk=room_id)
    total_price = 0  # Initialize total_price

    if request.method == "POST":
        form = AvailabilityForm(request.POST)
        if form.is_valid():
            checkin_date = form.cleaned_data["check_in"]
            checkout_date = form.cleaned_data["check_out"]

            price_per_night = room.price
            total_nights = (checkout_date - checkin_date).days
            total_price = price_per_night * total_nights

            reservations = Reservation.objects.filter(
                room=room,
                checkout_date__gt=checkin_date,
                checkin_date__lt=checkout_date,
            )

            if reservations.exists():
                alternative_rooms = Room.objects.filter(
                    room_type=room.room_type
                ).exclude(id=room.id)

                if alternative_rooms.exists():
                    alternative_rooms_data = []
                    for alt_room in alternative_rooms:
                        alternative_rooms_data.append(
                            {
                                "room_number": alt_room.room_number,
                                "description": alt_room.description,
                                "price": alt_room.price,
                                "room_id": alt_room.id,
                                "featured_image": (
                                    alt_room.featured_image.url
                                    if alt_room.featured_image
                                    else None
                                ),
                            }
                        )
                    message = f"Room {room.room_number} is not available."
                    return JsonResponse(
                        {
                            "available": False,
                            "message": message,
                            "alternative_rooms": alternative_rooms_data,
                            "check_in": checkin_date.strftime("%Y-%m-%d"),
                            "check_out": checkout_date.strftime("%Y-%m-%d"),
                        }
                    )
                else:
                    return JsonResponse(
                        {
                            "available": False,
                            "message": "No rooms available"
                            " for the selected dates.",
                        }
                    )
            else:
                return JsonResponse(
                    {
                        "available": True,
                        "message": "Room is available.",
                        "room_id": room.id,
                        "check_in": checkin_date.strftime("%Y-%m-%d"),
                        "check_out": checkout_date.strftime("%Y-%m-%d"),
                        "total_price": total_price,
                    }
                )
    else:
        form = AvailabilityForm()
    return render(
        request,
        "bookings/check_availability.html",
        {"form": form, "room": room, "total_price": total_price},
    )


def reservation_approval_list(request):
    pending_reservations = Reservation.objects.filter(
        reservation_status=Reservation.PENDING
    )
    context = {
        "pending_reservations": pending_reservations,
    }
    return render(request, "bookings/reservation_approval_list.html", context)


@login_required
def approve_reservation(request, reservation_id):
    """
    Approves a reservation and notifies the user.

    Parameters:
    - request: HTTP request object containing metadata about the request.
    - reservation_id: ID of the reservation to be approved.

    Returns:
    - JSON response confirming successful reservation approval.
    """
    reservation = get_object_or_404(Reservation, id=reservation_id)
    reservation.reservation_status = Reservation.CONFIRMED
    reservation.status_changed = True
    reservation.save()

    # Create a message for the user

    user = reservation.user
    checkin_date = reservation.checkin_date.strftime("%B %d, %Y")
    checkout_date = reservation.checkout_date.strftime("%B %d, %Y")
    # Approve reservation and notify user

    message_content = (
        f"Your reservation from {checkin_date} "
        f"to {checkout_date} has been approved."
    )
    message = Message(user=user, content=message_content)
    message.save()

    return JsonResponse({"message": "Reservation approved successfully"})


@login_required
def reject_reservation(request, reservation_id):
    """
    Rejects a reservation and notifies the user.

    Parameters:
    - request: HTTP request object containing metadata about the request.
    - reservation_id: ID of the reservation to be rejected.

    Returns:
    - JSON response confirming successful reservation rejection.
    """
    reservation = get_object_or_404(Reservation, id=reservation_id)
    reservation.reservation_status = Reservation.REJECTED
    reservation.status_changed = True
    reservation.save()

    user = reservation.user
    checkin_date = reservation.checkin_date
    checkout_date = reservation.checkout_date
    message_content = (
        f"Your reservation from {checkin_date} to {checkout_date} "
        f"has been rejected."
    )

    message = Message(user=user, content=message_content)
    message.save()

    return JsonResponse({"message": "Reservation rejected successfully"})


@login_required
def user_reservations_count(request):
    """
    Returns the count of reservations made by the current user.

    Parameters:
    - request: HTTP request object containing metadata about the request.

    Returns:
    - Integer count of reservations made by the current user.
    """
    user_reservations_count = Reservation.objects.filter(
        user=request.user
    ).count()
    return user_reservations_count


@login_required
def reservation_detail(request, reservation_id):
    """
    Renders the reservation detail page for a specific reservation.

    Parameters:
    - request: HTTP request object containing metadata about the request.
    - reservation_id: ID of the reservation to view details for.

    Returns:
    - Rendered reservation detail template with reservation details.
    """
    reservation = get_object_or_404(
        Reservation, id=reservation_id, user=request.user
    )

    return render(
        request,
        "bookings/reservation_detail.html",
        {"reservation": reservation},
    )


@login_required
@require_POST
def cancel_reservation(request, reservation_id):
    """
    Cancels a reservation.

    Parameters:
    - request: HTTP request object containing metadata about the request.
    - reservation_id: ID of the reservation to be canceled.

    Returns:
    - JSON response confirming successful reservation cancellation.
    """
    reservation = get_object_or_404(
        Reservation, id=reservation_id, user=request.user
    )

    if request.method == "POST":
        reservation.cancel
        return JsonResponse({"success": True})
    return redirect("home")


def room_detail(request, room_id):
    """
    Renders the room detail page for a specific room.

    Parameters:
    - request: HTTP request object containing metadata about the request.
    - room_id: ID of the room to view details for.

    Returns:
    - Rendered room detail template with room details.
    """
    room = Room.objects.get(pk=room_id)

    random_bathroom_image = BathroomImage.objects.order_by("?").first()
    random_minibar_image = MinibarImage.objects.order_by("?").first()

    return render(
        request,
        "bookings/room_detail.html",
        {
            "room": room,
            "random_bathroom_image": random_bathroom_image,
            "random_minibar_image": random_minibar_image,
        },
    )
