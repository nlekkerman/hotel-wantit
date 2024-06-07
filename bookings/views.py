# bookings/views.py
from django.shortcuts import render, redirect
from .forms import BookingForm
from .models import Booking, Room

def book_room(request):
    if request.method == 'POST':
        form = BookingForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('booking_confirmation')  # Redirect to confirmation page
    else:
        form = BookingForm()
    return render(request, 'bookings/book_room.html', {'form': form})

def booking_confirmation(request):
    # You can customize this view to display booking details or a thank you message
    return render(request, 'bookings/booking_confirmation.html')

def room_details(request, room_type):
    # Query the database for the room with the given room_type
    room = Room.objects.filter(room_type=room_type, available=True).first()
    return render(request, 'rooms.html', {'room': room})
