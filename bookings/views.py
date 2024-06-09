from django.shortcuts import render, redirect,get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import Room
from .models import Reservation
from .forms import ReservationForm



@login_required
def reserve_room(request, room_id):
    room = get_object_or_404(Room, id=room_id)

    if request.method == 'POST':
        form = ReservationForm(request.POST)
        if form.is_valid():
            reservation = Reservation(
                user=request.user,
                name=form.cleaned_data['name'],
                email=form.cleaned_data['email'],
                phone=form.cleaned_data['phone'],
                checkin_date=form.cleaned_data['checkin_date'],
                checkout_date=form.cleaned_data['checkout_date'],
                type_of_room=room.room_type,
                room=room
            )
            reservation.save()
            return redirect('reservation_success', reservation_id=reservation.id)
    else:
        form = ReservationForm()

    return render(request, 'bookings/reservation.html', {'form': form, 'room': room})

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