# hotel/context_processors.py

from bookings.models import Reservation
from reviews.models import Review, Comment

def check_pending_reservations():
    pending_reservations_count = Reservation.objects.filter(reservation_status=Reservation.PENDING).count()
    pending_comments_count = Comment.objects.filter(status=Comment.PENDING).count()
    pending_reviews_count = Review.objects.filter(status=0).count()
    return pending_reservations_count > 0 or pending_comments_count > 0 or pending_reviews_count > 0

def pending_reservations(request):
    pending_reservations_count = Reservation.objects.filter(reservation_status='pending').count()

    return {
        'pending_reservations_count': pending_reservations_count
    }

def pending_reviews_count(request):
    pending_reviews_count = Review.objects.filter(status=0).count()
    return {'pending_reviews_count': pending_reviews_count}

def pending_comments_count(request):
    pending_comments_count = Comment.objects.filter(status='pending').count()
    return {'pending_comments_count': pending_comments_count}


def total_pending_count(request):
    pending_comments = Comment.objects.filter(status='pending').count()
    pending_reviews = Review.objects.filter(status=0).count()
    pending_reservations = Reservation.objects.filter(reservation_status='pending').count()
    total_pending = pending_comments + pending_reviews + pending_reservations
    return {
        'total_pending_count': total_pending
       
    }

# context_processors.py (Profile-specific)

def profile_pending_reservations(request):
    if request.user.is_authenticated:
        pending_reservations_count = Reservation.objects.filter(reservation_status='pending', user=request.user).count()
    else:
        pending_reservations_count = 0
    return {'profile_pending_reservations_count': pending_reservations_count}


def profile_total_pending_count(request):
    if request.user.is_authenticated:
        pending_comments = Comment.objects.filter(status='pending', user=request.user).count()
        pending_reviews = Review.objects.filter(status=0, user=request.user).count()
        pending_reservations = Reservation.objects.filter(reservation_status='confirmed', user=request.user).count()
        total_pending = pending_comments + pending_reviews + pending_reservations
    else:
        total_pending = 0
    return {
        'profile_total_pending_count': total_pending
    }
