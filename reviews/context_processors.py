# reviews/context_processors.py
from .models import Review

def pending_reviews_count(request):
    if request.user.is_authenticated and request.user.is_staff:
        return {'pending_reviews_count': Review.objects.filter(status=0).count()}
    return {}


def user_pending_counts(request):
    if request.user.is_authenticated:
        reservations_count = user_reservations_count(request)
        reviews_count = user_pending_reviews_count(request)
        comments_count = user_pending_comments_count(request)
        total_count = reservations_count + reviews_count + comments_count
    else:
        reservations_count = reviews_count = comments_count = total_count = 0

    return {
        'user_reservations_count': reservations_count,
        'user_pending_reviews_count': reviews_count,
        'user_pending_comments_count': comments_count,
        'total_notifications_count': total_count
    }