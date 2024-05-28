from django.shortcuts import render
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
