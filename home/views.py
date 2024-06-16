from django.shortcuts import render
from reviews.utils import review_for_slide

def home_view(request):

    random_review = review_for_slide()

    return render(request, 'home/home.html', {
        'random_review': random_review
    })
