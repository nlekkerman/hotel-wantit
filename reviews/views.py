from django.shortcuts import render, get_object_or_404
from django.views import generic
from .models import Review

class ReviewList(generic.ListView):
    queryset = Review.objects.all()
    template_name = "review_list.html"
    paginate_by = 6
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        for review in context['object_list']:
            review.stars = range(review.rating)
            review.empty_stars = range(5 - review.rating)
        return context

def review_detail(request, pk):
    """
    Display an individual review.

    **Context**

    ``review``
        An instance of :model:`reviews.Review`.

    **Template:**

    :template:`reviews/review_detail.html`
    """

    queryset = Review.objects.filter(status=1)
    review = get_object_or_404(queryset, pk=pk)

    return render(
        request,
        "reviews/review_detail.html",
        {"review": review},
    )