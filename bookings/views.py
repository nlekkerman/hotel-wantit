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


logger = logging.getLogger(__name__)


@login_required
def reserve_room(request, room_id):
    room = get_object_or_404(Room, id=room_id)
    
    if request.method == 'POST':
        form = ReservationForm(request.POST)
        
        if form.is_valid():
            name = form.cleaned_data['name']
            email = form.cleaned_data['email']
            phone = form.cleaned_data['phone']
            checkin_date = form.cleaned_data['checkin_date']
            checkout_date = form.cleaned_data['checkout_date']

            price_per_night = room.price
            total_nights = (checkout_date - checkin_date).days
            total_price = price_per_night * total_nights

            reservation = Reservation.objects.create(
                user=request.user,
                room=room,
                name=name,
                email=email,
                phone=phone,
                checkin_date=checkin_date,
                checkout_date=checkout_date,
                price=total_price,
                type_of_room=room.room_type
            )

            # Return JSON response with reservation details
            data = {
                'room_number': room.room_number,
                'room_type': room.room_type,
                'checkin_date': checkin_date.strftime('%Y-%m-%d'),
                'checkout_date': checkout_date.strftime('%Y-%m-%d'),
                'total_price': f'{total_price:.2f}',
            }
            return JsonResponse(data)
        else:
            # Handle form validation errors
            errors = form.errors.as_json()
            return JsonResponse({'errors': errors}, status=400)
    else:
        # Handle GET request (if needed)
        check_in_date = request.GET.get('check_in')
        check_out_date = request.GET.get('check_out')

        if check_in_date and check_out_date:
            form = ReservationForm(initial={
                'checkin_date': check_in_date,
                'checkout_date': check_out_date
            })
        else:
            form = ReservationForm()

    return render(request, 'bookings/reservation.html', {'form': form, 'room': room})
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
    
    if request.method == 'POST':
        form = AvailabilityForm(request.POST)
        if form.is_valid():
            check_in = form.cleaned_data['check_in']
            check_out = form.cleaned_data['check_out']
            
            reservations = Reservation.objects.filter(
                room=room,
                checkout_date__gt=check_in,
                checkin_date__lt=check_out
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
                        })
                    
                    return JsonResponse({
                        'available': False,
                        'message': 'Room is not available. Alternative rooms suggested.',
                        'alternative_rooms': alternative_rooms_data,
                        'check_in': check_in.strftime('%Y-%m-%d'),  # Convert date to string for JSON response
                        'check_out': check_out.strftime('%Y-%m-%d')  # Convert date to string for JSON response
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
                    'check_in': check_in.strftime('%Y-%m-%d'),  # Convert date to string for JSON response
                    'check_out': check_out.strftime('%Y-%m-%d')  # Convert date to string for JSON response
                })
    else:
        form = AvailabilityForm()
    
    return render(request, 'check_availability.html', {'form': form, 'room': room})

def reservation_approval_list(request):
    pending_reservations = Reservation.objects.filter(reservation_status=Reservation.PENDING)
    context = {
        'pending_reservations': pending_reservations,
    }
    return render(request, 'bookings/reservation_approval_list.html', context)

def approve_reservation(request, reservation_id):
    reservation = get_object_or_404(Reservation, id=reservation_id)
    reservation.reservation_status = Reservation.CONFIRMED  # Use CONFIRMED, not APPROVED
    reservation.save()
    return redirect('reservation-approval-list')

def reject_reservation(request, reservation_id):
    reservation = get_object_or_404(Reservation, id=reservation_id)
    reservation.reservation_status = Reservation.REJECTED
    reservation.save()
    return redirect('reservation-approval-list')

@login_required
def user_reservations_count(request):
    user_reservations_count = Reservation.objects.filter(user=request.user).count()
    return user_reservations_count