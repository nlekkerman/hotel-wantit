# reviews/urls.py

from . import views
from django.urls import path

urlpatterns = [
path('reviews/', views.ReviewList.as_view(), name='review-list'),
path('reviews/<int:pk>/', views.review_detail, name='review_detail'),
path('create-review/', views.create_review, name='create-review'),
path('reviews/success/', views.review_success_message, name='review_success'),
path('reviews/<int:pk>/edit/', views.edit_review, name='edit-review'),
path('reviews/<int:pk>/delete/', views.delete_review, name='delete-review'),
path('reviews/approval/', views.review_approval_list, name='review-approval-list'),
path('reviews/approve/<int:review_id>/', views.approve_review, name='approve-review'),
path('reviews/reject/<int:review_id>/', views.reject_review, name='reject-review'),
path('review/<int:review_id>/add_comment/', views.add_comment, name='add_comment'),
path('comments/approval/', views.comment_approval_list, name='comment-approval-list'),
path('comments/approve/<int:comment_id>/', views.approve_comment, name='approve-comment'),
path('comments/reject/<int:comment_id>/', views.reject_comment, name='reject-comment'),
path('comments/<int:pk>/edit/', views.edit_comment, name='edit-comment'),
path('comments/<int:pk>/delete/', views.delete_comment, name='delete-comment'),
path('log-star-rating/', views.log_star_rating, name='log_star_rating'),




]