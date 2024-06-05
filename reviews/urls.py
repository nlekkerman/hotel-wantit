# reviews/urls.py

from . import views
from django.urls import path

urlpatterns = [
path('reviews/', views.ReviewList.as_view(), name='review-list'),
path('reviews/<int:pk>/', views.review_detail, name='review_detail'),
path('create-review/', views.create_review, name='create-review'),
path('reviews/approval/', views.review_approval_list, name='review-approval-list'),
path('reviews/approve/<int:review_id>/', views.approve_review, name='approve-review'),
path('reviews/reject/<int:review_id>/', views.reject_review, name='reject-review'),

]