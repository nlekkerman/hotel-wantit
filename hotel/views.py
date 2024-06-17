from django.shortcuts import render
from bookings.models import Reservation
from reviews.models import Review, Comment
from django.contrib.auth.decorators import login_required

@login_required
def user_notifications(request):
    # Retrieve reservations related to the logged-in user
    user_reservations = Reservation.objects.filter(user=request.user , reservation_status='confirmed')

    # Retrieve pending reviews related to the logged-in user
    user_pending_reviews = Review.objects.filter(user=request.user, status=0)

    # Retrieve pending comments related to the logged-in user
    user_pending_comments = Comment.objects.filter(user=request.user, status='pending')

    return render(request, 'notifications.html', {
        'user_reservations': user_reservations,
        'user_pending_reviews': user_pending_reviews,
        'user_pending_comments': user_pending_comments,
    })
