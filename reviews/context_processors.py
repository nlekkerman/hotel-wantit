# reviews/context_processors.py
from .models import Review

def pending_reviews_count(request):
    if request.user.is_authenticated and request.user.is_staff:
        return {'pending_reviews_count': Review.objects.filter(status=0).count()}
    return {}
