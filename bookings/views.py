from django.shortcuts import render, redirect,get_object_or_404
from django.contrib.auth.decorators import login_required
import logging
from django.core.mail import send_mail
from django.conf import settings
from django.http import HttpResponseServerError,HttpResponse  
from .models import Room
from .models import Reservation
from .forms import ReservationForm
from django.http import JsonResponse
from datetime import datetime
from django.utils.timezone import datetime, timedelta
from django.views.decorators.http import require_POST
from django.views.decorators.http import require_GET
from django.db.models import Q  


logger = logging.getLogger(__name__)

@login_required
def reserve_room(request, room_id):
    room = get_object_or_404(Room, id=room_id)
    if request.method == 'POST':
        form = ReservationForm(request.POST)
        if form.is_valid():
            checkin_date = form.cleaned_data['checkin_date']
            checkout_date = form.cleaned_data['checkout_date']

            overlapping_reservations = Reservation.objects.filter(
                room=room,
                checkin_date__lt=checkout_date,
                checkout_date__gt=checkin_date
            )

            if overlapping_reservations.exists():
                form.add_error(None, 'The selected dates overlap with an existing reservation.')
            else:
                reservation = Reservation(
                    user=request.user,
                    name=form.cleaned_data['name'],
                    email=form.cleaned_data['email'],
                    phone=form.cleaned_data['phone'],
                    checkin_date=checkin_date,
                    checkout_date=checkout_date,
                    type_of_room=room.room_type,
                    room=room
                )
                reservation.save()

                try:
                    send_mail(
                        subject='Reservation Confirmation',
                        message=f"Dear {reservation.name},\n\n"
                                f"Thank you for your reservation at Hotel Wantit.\n\n"
                                f"Reservation Details:\n"
                                f"Name: {reservation.name}\n"
                                f"Email: {reservation.email}\n"
                                f"Phone: {reservation.phone}\n"
                                f"Check-in Date: {reservation.checkin_date}\n"
                                f"Check-out Date: {reservation.checkout_date}\n"
                                f"Type of Room: {reservation.get_type_of_room_display()}\n\n"
                                f"We look forward to welcoming you.\n\n"
                                f"Best regards,\n"
                                f"Hotel Wantit Team",
                        from_email=settings.EMAIL_HOST_USER,
                        recipient_list=[reservation.email],
                        fail_silently=False,
                    )
                except Exception as e:
                    logger.error(f"Error sending confirmation email: {e}")

                print("Redirection to reservation success page")  # Add this line for verification
                return redirect('reservation_success', reservation_id=reservation.id)
    else:
        form = ReservationForm()

    return render(request, 'bookings/reservation.html', {'form': form, 'room': room})




@login_required
def reservation_success(request):
    # Assuming each reservation is associated with a user
    reservation = Reservation.objects.filter(user=request.user).first()
    if reservation:
        # Reservation found, proceed with displaying details
        data = {
            'name': reservation.name,
            'email': reservation.email,
            'phone': reservation.phone,
            'checkin_date': reservation.checkin_date,
            'checkout_date': reservation.checkout_date,
            'room_type': reservation.get_type_of_room_display(),
        }
        return JsonResponse(data)
    else:
        # No reservation found for the user
        return JsonResponse({'error': 'No reservation found for the user'}, status=404)

def book_room(request):
    return render(request, 'bookings/book_room.html')


def rooms_view(request):
    room_type = request.GET.get('type')  # Get the room type from query parameter
    if room_type:
        rooms = Room.objects.filter(room_type=room_type)
    else:
        rooms = Room.objects.all()
    context = {
        'rooms': rooms,
        'room_type': room_type
    }
    return render(request, 'bookings/rooms.html', context)

def send_confirmation_email(request):
    
    try:
        send_mail(
            subject='Confirmation Email',
            message='This is a confirmation email.',
            from_email=settings.EMAIL_HOST_USER,  # Use the email host user defined in settings
            recipient_list=['recipient@example.com'],
            fail_silently=False,
        )
        # If no exception occurred, display a success message
        messages.success(request, 'Email sent successfully!')
        return HttpResponse('Email sent successfully!')
    except Exception as e:
        # Log the error
        print(f'Error sending email: {e}')
        # Display an error message
        messages.error(request, f'Failed to send email: {e}')
        # Return an error response
        return HttpResponseServerError('Failed to send email. Please try again later.')
    try:
        send_mail(
            subject='Confirmation Email',
            message='This is a confirmation email.',
            from_email='your_email@example.com',
            recipient_list=['recipient@example.com'],
            fail_silently=False,
        )
        # If no exception occurred, display a success message
        messages.success(request, 'Email sent successfully!')
        return HttpResponse('Email sent successfully!')
    except Exception as e:
        # Log the error
        print(f'Error sending email: {e}')
        # Display an error message
        messages.error(request, f'Failed to send email: {e}')
        # Return an error response
        return HttpResponseServerError('Failed to send email. Please try again later.')
    try:
        send_mail(
            subject='Confirmation Email',
            message='This is a confirmation email.',
            from_email='your_email@example.com',
            recipient_list=['recipient@example.com'],
            fail_silently=False,
        )
        return HttpResponse('Email sent successfully!')
    except Exception as e:
        # Log the error
        print(f'Error sending email: {e}')
        # Return an error response
        return HttpResponseServerError('Failed to send email. Please try again later.')



    if request.method == 'GET':
        room_id = request.GET.get('room_id')
        checkin_date = request.GET.get('checkin_date')
        checkout_date = request.GET.get('checkout_date')

        # Perform availability check
        overlapping_reservations = Reservation.objects.filter(
            Q(room_id=room_id) &
            ((Q(checkin_date__lt=checkout_date) & Q(checkout_date__gt=checkin_date)) |
             (Q(checkin_date__gte=checkout_date) & Q(checkout_date__lte=checkout_date)))
        )

        available = not overlapping_reservations.exists()

        return JsonResponse({'available': available})
    else:
        # Return a JsonResponse indicating that only GET requests are allowed
        return JsonResponse({'error': 'Only GET requests are allowed for this endpoint.'}, status=405)
    if request.method == 'GET':
        room_id = request.GET.get('room_id')
        checkin_date = request.GET.get('checkin_date')
        checkout_date = request.GET.get('checkout_date')

        # Perform availability check (similar to your existing logic)
        overlapping_reservations = Reservation.objects.filter(
            Q(room_id=room_id) &
            ((Q(checkin_date__lt=checkout_date) & Q(checkout_date__gt=checkin_date)) |
             (Q(checkin_date__gte=checkout_date) & Q(checkout_date__lte=checkout_date)))
        )

        available = not overlapping_reservations.exists()

        return JsonResponse({'available': available})
    bookings = Booking.objects.filter(room=room)
    next_available_day = checkout_date + timedelta(days=1)
    while True:
        overlapping_booking = bookings.filter(
            checkin_date__lte=next_available_day,
            checkout_date__gte=next_available_day
        ).exists()
        if not overlapping_booking:
            return next_available_day
        next_available_day += timedelta(days=1)
    # Get the room object
    room = get_object_or_404(Room, id=room_id)
    
    if request.method == 'GET':
        # Retrieve check-in and check-out dates from the request parameters
        checkin_date_str = request.GET.get('checkin_date')
        checkout_date_str = request.GET.get('checkout_date')

        # Convert date strings to datetime objects
        checkin_date = datetime.strptime(checkin_date_str, '%Y-%m-%d').date()
        checkout_date = datetime.strptime(checkout_date_str, '%Y-%m-%d').date()

        # Check if the room is available for the selected dates
        overlapping_booking = Booking.objects.filter(
            room=room,
            checkin_date__lt=checkout_date,
            checkout_date__gt=checkin_date
        ).exists()

        if overlapping_booking:
            # If there is an overlapping booking, find the next available day
            response_data = {
                'message': f"Room is not available for the selected dates. Next available day is .",
                
            }
            return JsonResponse(response_data, status=400)
        else:
            return JsonResponse({'message': 'Room is available!'})
    else:
        # Return a JsonResponse indicating that only GET requests are allowed
        return JsonResponse({'error': 'Only GET requests are allowed for this endpoint.'}, status=405)      


    """
    Find the next available day for booking the room
    """
    # Get all existing bookings for the room
    bookings = Booking.objects.filter(room=room)
    
    # Find the first available day after the selected checkout date
    next_available_day = checkout_date
    while True:
        overlapping_booking = bookings.filter(
            checkin_date__lte=next_available_day,
            checkout_date__gt=next_available_day
        ).exists()
        if not overlapping_booking:
            return next_available_day
        next_available_day += timedelta(days=1)
    """
    Find the next available day for booking the room
    """
    # Get all existing bookings for the room
    bookings = Booking.objects.filter(room=room)

    # Find the first available day after the selected checkout date
    next_available_day = checkout_date + timedelta(days=1)
    while True:
        overlapping_booking = bookings.filter(
            checkin_date__lte=next_available_day,
            checkout_date__gte=next_available_day
        ).exists()
        if not overlapping_booking:
            return next_available_day
        next_available_day += timedelta(days=1)
    """
    Find the next available day for booking the room
    """
    # Get all existing bookings for the room
    bookings = Booking.objects.filter(room=room)
    
    # Find the first available day after the selected checkout date
    next_available_day = checkout_date
    while True:
        overlapping_booking = bookings.filter(
            checkin_date__lt=next_available_day,
            checkout_date__gt=next_available_day
        ).exists()
        if not overlapping_booking:
            return next_available_day
        next_available_day += timedelta(days=1)




def check_availability(request):
    if request.method == 'GET':
        room_id = request.GET.get('room_id')
        checkin_date = request.GET.get('checkin_date')
        checkout_date = request.GET.get('checkout_date')

        # Perform availability check
        overlapping_reservations = Reservation.objects.filter(
            Q(room_id=room_id) &
            ((Q(checkin_date__lt=checkout_date) & Q(checkout_date__gt=checkin_date)) |
             (Q(checkin_date__gte=checkout_date) & Q(checkout_date__lte=checkout_date)))
        )

        available = not overlapping_reservations.exists()

        return JsonResponse({'available': available})
    else:
        # Return a JsonResponse indicating that only GET requests are allowed
        return JsonResponse({'error': 'Only GET requests are allowed for this endpoint.'}, status=405)

def check_availability(request):
    room_id = request.GET.get('room_id')
    checkin_date = request.GET.get('checkin_date')
    checkout_date = request.GET.get('checkout_date')

    checkin_date = datetime.strptime(checkin_date, "%Y-%m-%d").date()
    checkout_date = datetime.strptime(checkout_date, "%Y-%m-%d").date()

    reservations = Reservation.objects.filter(room_id=room_id)
    available = not any(
        (reservation.checkin_date <= checkout_date and reservation.checkout_date >= checkin_date)
        for reservation in reservations
    )

    available_rooms = []
    room_details = None

    if available:
        room = Room.objects.get(id=room_id)
        room_details = {
            'room_number': room.room_number,
            'room_type': room.room_type,
            'price': room.price
        }
    else:
        selected_room = Room.objects.get(id=room_id)
        similar_rooms = Room.objects.filter(room_type=selected_room.room_type)
        for room in similar_rooms:
            room_reservations = Reservation.objects.filter(room_id=room.id)
            if not any(
                (reservation.checkin_date <= checkout_date and reservation.checkout_date >= checkin_date)
                for reservation in room_reservations
            ):
                available_rooms.append({
                    'room_number': room.room_number,
                    'room_type': room.room_type,
                    'price': room.price
                })

    return JsonResponse({'available': available, 'room': room_details, 'available_rooms': available_rooms})