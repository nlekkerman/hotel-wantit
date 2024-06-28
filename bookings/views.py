from django.shortcuts import render, redirect,get_object_or_404
from django.contrib.auth.decorators import login_required
import logging
from django.core.mail import send_mail
from django.conf import settings
from django.http import HttpResponseServerError,HttpResponse  
from .models import Room
from .models import Reservation
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
    room = Room.objects.get(pk=room_id)

    if request.method == 'POST':
        form = ReservationForm(request.POST)
        if form.is_valid():
            reservation = form.save(commit=False)
            reservation.room = room
            reservation.user = request.user  # Assuming user is authenticated
            reservation.first_name = request.user.first_name
            reservation.last_name = request.user.last_name
            reservation.name = request.user.first_name
            
            # Calculate total nights
            checkin_date = form.cleaned_data['checkin_date']
            checkout_date = form.cleaned_data['checkout_date']
            total_nights = (checkout_date - checkin_date).days
            
            # Calculate total price with discount
            price_per_night = room.price
            total_price = calculate_discounted_price(price_per_night, total_nights)
            
            reservation.total_price = total_price
            reservation.save()
            
            # Return success response with reservation details
            return JsonResponse({
                'room_number': room.room_number,
                'room_type': room.room_type,
                'checkin_date': reservation.checkin_date,
                'checkout_date': reservation.checkout_date,
                'total_price': reservation.total_price,
                'name': reservation.name,
            })
        else:
            # Form is not valid, handle the error scenario
            return JsonResponse({'error': form.errors}, status=400)
    else:
        initial_data = {
            'checkin_date': request.GET.get('check_in'),
            'checkout_date': request.GET.get('check_out'),
            'type_of_room': room.room_type  # Assuming room_type is a field in ReservationForm
        }
        form = ReservationForm(initial=initial_data)
    
    return render(request, 'bookings/reservation.html', {'form': form, 'room': room})

def calculate_discounted_price(price_per_night, total_nights):
    # Convert to Decimal for precision
    price_per_night_decimal = Decimal(str(price_per_night))
    total_nights_decimal = Decimal(str(total_nights))
    
    # Calculate discounted price with 10% discount
    discounted_price = price_per_night_decimal * total_nights_decimal * Decimal('0.9')
    return discounted_price


    
def book_room(request):
    return render(request, 'bookings/book_room.html')


def rooms_view(request):
    room_type = request.GET.get('type')  # Get the room type from query parameter

     # Get distinct room types from the database
    room_types = Room.objects.values_list('room_type', flat=True).distinct()
    if room_type:
        rooms = Room.objects.filter(room_type=room_type).order_by('room_number')
    else:
        rooms = Room.objects.all()
    context = {
        'rooms': rooms,
        'room_type': room_type
    }
    return render(request, 'bookings/rooms.html', context)



@login_required
def check_availability(request, room_id):
    room = get_object_or_404(Room, pk=room_id)
    total_price = 0  # Initialize total_price

    if request.method == 'POST':
        form = AvailabilityForm(request.POST)
        if form.is_valid():
            checkin_date = form.cleaned_data['check_in']
            checkout_date = form.cleaned_data['check_out']

            price_per_night = room.price
            total_nights = (checkout_date - checkin_date).days
            total_price = price_per_night * total_nights

            reservations = Reservation.objects.filter(
                room=room,
                checkout_date__gt=checkin_date,
                checkin_date__lt=checkout_date
            )

            if reservations.exists():
                alternative_rooms = Room.objects.filter(
                    room_type=room.room_type
                ).exclude(id=room.id)

                if alternative_rooms.exists():
                    alternative_rooms_data = []
                    for alt_room in alternative_rooms:
                        alternative_rooms_data.append({
                            'room_number': alt_room.room_number,
                            'description': alt_room.description,
                            'price': alt_room.price,
                            'room_id': alt_room.id,
                             'featured_image': alt_room.featured_image.url if alt_room.featured_image else None,
                        })
                    message = f"Room {room.room_number} is not available."
                    return JsonResponse({
                        'available': False,
                        'message': message,
                        'alternative_rooms': alternative_rooms_data,
                        'check_in': checkin_date.strftime('%Y-%m-%d'),
                        'check_out': checkout_date.strftime('%Y-%m-%d')
                    })
                else:
                    return JsonResponse({
                        'available': False,
                        'message': 'No rooms available for the selected dates.'
                    })
            else:
                return JsonResponse({
                    'available': True,
                    'message': 'Room is available.',
                    'room_id': room.id,
                    'check_in': checkin_date.strftime('%Y-%m-%d'),
                    'check_out': checkout_date.strftime('%Y-%m-%d'),
                    'total_price': total_price  # Pass total_price in the response
                })
    else:
        form = AvailabilityForm()

    return render(request, 'bookings/check_availability.html', {'form': form, 'room': room, 'total_price': total_price})


def reservation_approval_list(request):
    pending_reservations = Reservation.objects.filter(reservation_status=Reservation.PENDING)
    context = {
        'pending_reservations': pending_reservations,
    }
    return render(request, 'bookings/reservation_approval_list.html', context)

def approve_reservation(request, reservation_id):
    reservation = get_object_or_404(Reservation, id=reservation_id)
    reservation.reservation_status = Reservation.CONFIRMED
    reservation.save()
    return JsonResponse({'message': 'Reservation approved successfully'})

    # Redirect to reservation_approval_list
    return redirect('reservation-approval-list')

def reject_reservation(request, reservation_id):
    reservation = get_object_or_404(Reservation, id=reservation_id)
    reservation.reservation_status = Reservation.REJECTED
    reservation.save()
    return JsonResponse({'message': 'Reservation rejected successfully'})

    # Redirect to reservation_approval_list
    return redirect('reservation-approval-list')

@login_required
def user_reservations_count(request):
    user_reservations_count = Reservation.objects.filter(user=request.user).count()
    return user_reservations_count

@login_required
def reservation_detail(request, reservation_id):
    reservation = get_object_or_404(Reservation, id=reservation_id, user=request.user)
    
    return render(request, 'bookings/reservation_detail.html', {'reservation': reservation})



@login_required
@require_POST
def cancel_reservation(request, reservation_id):
    reservation = get_object_or_404(Reservation, id=reservation_id, user=request.user)
    
    if request.method == 'POST':
        # Handle reservation cancellation logic here
        reservation.cancel()  # Example method to cancel reservation, adjust as per your model
        
        # Optionally, you can send a JSON response to indicate success
        return JsonResponse({'success': True})
    
    # Handle GET request or any other method if needed
    return redirect('home')