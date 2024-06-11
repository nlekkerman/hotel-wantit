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
    confirmation_message = None

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

                # Redirect to reservation success page with reservation ID
                return redirect('reservation_success', reservation_id=reservation.id)

    else:
        form = ReservationForm()

    return render(request, 'bookings/reservation.html', {'form': form, 'room': room, 'confirmation_message': confirmation_message})


@login_required
def reservation_success(request, reservation_id):
    reservation = get_object_or_404(Reservation, id=reservation_id)
    return render(request, 'bookings/reservation_success.html', {'reservation': reservation})

    
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



@require_POST
def check_availability(request):
    room_id = request.POST.get('room_id')
    checkin_date = request.POST.get('checkin_date')
    checkout_date = request.POST.get('checkout_date')

    # Perform availability check
    reservations = Reservation.objects.filter(room_id=room_id, 
                                              checkin_date__lte=checkout_date, 
                                              checkout_date__gte=checkin_date)
    if reservations.exists():
        # Room is not available
        return JsonResponse({'available': False})

    # Room is available
    reservation_info = "Room is available for the specified period."
    # You can customize the reservation_info with any additional information
    return JsonResponse({'available': True, 'reservation_info': reservation_info})