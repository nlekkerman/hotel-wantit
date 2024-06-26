from django.shortcuts import render
from bookings.models import Reservation
from reviews.models import Review, Comment
from django.http import JsonResponse
from bookings.models import Reservation 
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

def admin_dashboard(request):
    pending_reviews = Review.objects.filter(status=0).count()
    pending_comments = Comment.objects.filter(status='pending').count()
    pending_reservations = Reservation.objects.filter(reservation_status='pending').count()

    total_pending = pending_reviews + pending_comments + pending_reservations

    context = {
        'pending_reviews': pending_reviews,
        'pending_comments': pending_comments,
        'pending_reservations': pending_reservations,
        'total_pending': total_pending
    }

    # Construct a JSON response with your context data
    return JsonResponse(context)

def admin_interface(request):
    context = {
        'title': 'Admin Interface',
        # Add any other context variables you need
    }
    return render(request, 'admin_interface.html', context)