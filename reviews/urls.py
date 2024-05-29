# reviews/urls.py

from . import views
from django.urls import path

urlpatterns = [
path('reviews/', views.ReviewList.as_view(), name='review-list'),
path('reviews/<int:pk>/', views.review_detail, name='review_detail'),  # Ensure this line is correct

]