from django.shortcuts import render
from django.views import generic
from .models import Review

class ReviewList(generic.ListView):
    queryset = Review.objects.all()
    template_name = "review_list.html"
    paginate_by = 6
