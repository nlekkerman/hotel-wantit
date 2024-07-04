from .models import Review


def pending_reviews_count(request):
    """
    Returns the count of pending reviews for staff members.

    Args:
        request (HttpRequest): The HTTP request object.

    Returns:
        dict: Dictionary containing the count of pending reviews if the user is
              authenticated and is a staff member; otherwise, an empty dictionary.

    """
    if request.user.is_authenticated and request.user.is_staff:
        return {
            "pending_reviews_count": Review.objects.filter(status=0).count()
        }
    return {}


def user_pending_counts(request):
    """
    Returns counts related to pending user actions such as reservations, reviews,
    and comments.

    Args:
        request (HttpRequest): The HTTP request object.

    Returns:
        dict: Dictionary containing counts for user reservations, pending reviews,
              pending comments, and total notifications count. If the user is not
              authenticated, all counts are zero.

    """
    if request.user.is_authenticated:
        reservations_count = user_reservations_count(request)
        reviews_count = user_pending_reviews_count(request)
        comments_count = user_pending_comments_count(request)
        total_count = reservations_count + reviews_count + comments_count
    else:
        reservations_count = reviews_count = comments_count = total_count = 0
    return {
        "user_reservations_count": reservations_count,
        "user_pending_reviews_count": reviews_count,
        "user_pending_comments_count": comments_count,
        "total_notifications_count": total_count,
    }
