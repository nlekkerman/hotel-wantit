# reviews/urls.py

from . import views
from django.urls import path

urlpatterns = [
path('reviews/', views.ReviewList.as_view(), name='review-list'),
]