from django.shortcuts import render
from reviews.utils import review_for_slide

def home_view(request):

    random_review = review_for_slide()

    return render(request, 'home/home.html', {
        'random_review': random_review
    })


def show_renovated_rooms(request):
    return render(request, 'home/renovated_rooms.html')