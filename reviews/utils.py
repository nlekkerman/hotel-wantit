# reviews/utils.py
import random
from .models import Review

def review_for_slide():
    approved_reviews = Review.objects.filter(status=1)
    if approved_reviews.exists():
        return random.choice(approved_reviews)
    return None
