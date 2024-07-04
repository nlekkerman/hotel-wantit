from django.shortcuts import render
from reviews.utils import review_for_slide


def home_view(request):
    """
    Renders the home page with a random review displayed.

    Retrieves a random review using the review_for_slide() function
    and passes it to the template.

    Args:
        request (HttpRequest): The HTTP request object.

    Returns:
        HttpResponse: Renders the 'home/home.html' template
        with the random_review context.

    """
    random_review = review_for_slide()
    return render(request, "home/home.html", {"random_review": random_review})


def show_renovated_rooms(request):
    """
    Renders the page displaying renovated rooms.

    Args:
        request (HttpRequest): The HTTP request object.

    Returns:
        HttpResponse: Renders the 'home/renovated_rooms.html' template.

    """
    return render(request, "home/renovated_rooms.html")
