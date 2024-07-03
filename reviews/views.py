from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from django.contrib.admin.views.decorators import staff_member_required
from .forms import ReviewForm, CommentForm
from django.db.models import Count, Q
from django.views import generic
from .models import Review, Comment
from home.models import Message
from bookings.models import Reservation 
import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt



class ReviewList(generic.ListView):
    template_name = "review_list.html"
    paginate_by = 6

    def get_queryset(self):
        # Fetch all reviews
        queryset = Review.objects.filter(status=1).order_by('-created_at')

        # Iterate through each review and annotate the count of comments associated with it
        for review in queryset:
            review.comment_count = review.comments.filter(status='approved').count()

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context


        
def review_detail(request, pk):
    review = get_object_or_404(Review, pk=pk)
    comment_count = review.comments.filter(status=Comment.APPROVED).count()

    if request.method == 'POST':
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.review = review
            comment.user = request.user
            comment.status = Comment.PENDING  # Set status to pending
            comment.save()
            messages.success(request, 'Your comment has been submitted and is pending approval.')
            return redirect('review_detail', pk=review.id)
    else:
        form = CommentForm()

    approved_comments = review.comments.filter(status=Comment.APPROVED)

    return render(request, 'reviews/review_detail.html', {
        'review': review,
        'form': form,
        'comments': approved_comments,
        'comment_count': comment_count,
    })

    
@login_required
def create_review(request):
    if request.method == 'POST':
        form = ReviewForm(request.POST)
        if form.is_valid():
            review = form.save(commit=False)
            review.user = request.user
            review.status = 0  # Assuming 0 means pending approval
            review.save()

            # Handle AJAX request to log star rating if present
            if request.headers.get('x-requested-with') == 'XMLHttpRequest':
                data = json.loads(request.body)
                rating = data.get('rating')
                # Process the rating data as needed (e.g., save it to the database)
                print(f'Star rating received: {rating}')
                return JsonResponse({'status': 'success', 'rating': rating})

            messages.success(request, 'Review submitted successfully!')
            return redirect('review_success')  # Redirect to the review success message
        else:
            messages.error(request, 'Error submitting review. Please correct the errors.')
    else:
        form = ReviewForm()

    return render(request, 'reviews/create_review.html', {'form': form})

@csrf_exempt  # Use csrf_exempt for simplicity in this example; consider using CSRF protection in production
def log_star_rating(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        rating = data.get('rating')
        print(f'Star rating received: {rating}')
        return JsonResponse({'status': 'success', 'rating': rating})
    return JsonResponse({'status': 'fail'}, status=400)

def review_success_message(request):
    return render(request, 'reviews/partials/review_success_message.html')

@login_required
def edit_review(request, pk):
    review = get_object_or_404(Review, pk=pk)

    # Check if the current user is the author of the review
    if request.user != review.user:
        return redirect('review_detail', pk=pk)  # Redirect or handle unauthorized access

    if request.method == 'POST':
        form = ReviewForm(request.POST, instance=review)
        if form.is_valid():
            review = form.save(commit=False)
            review.status = 0 
            review.last_edited_at = timezone.now() 
            review.save()
            return render(request, 'reviews/partials/reviews_action_message.html', {
                'object_type': 'review',
                'action_type': 'edit',
                'object_list_url': 'review-list'
            })  
    else:
        form = ReviewForm(instance=review)

    return render(request, 'reviews/edit_review.html', {'form': form, 'review': review, 'show_modal': True})

@login_required
def delete_review(request, pk):
    review = get_object_or_404(Review, pk=pk)

    # Check if the current user is the author of the review
    if request.user != review.user:
        return redirect('review_detail', pk=pk)  # Redirect or handle unauthorized access

    if request.method == 'POST':
        review.delete()
        return render(request, 'reviews/partials/reviews_action_message.html', {
            'object_type': 'review',
            'action_type': 'delete',
            'object_list_url': 'review-list'
        })

    # If not a POST request, simply redirect to review-list
    return redirect('review-list')   

@login_required
def delete_comment(request, pk):
    comment = get_object_or_404(Comment, pk=pk)
    if request.method == 'POST':
        comment.delete()
        return render(request, 'reviews/partials/reviews_action_message.html', {
            'object_type': 'comment',
            'action_type': 'delete',
            'object_list_url': 'review-list'
        })
    # If not POST request, render delete confirmation page
    return render(request, 'reviews/delete_comment.html', {'comment': comment})
@login_required

def edit_comment(request, pk):
    comment = get_object_or_404(Comment, pk=pk)

    # Check if the current user is the author of the comment
    if request.user != comment.user:
        return redirect('comment_detail', pk=pk)  # Redirect or handle unauthorized access

    if request.method == 'POST':
        form = CommentForm(request.POST, instance=comment)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.status = Comment.PENDING  # Update status to pending
            comment.last_edited_at = timezone.now()  # Update last edited timestamp if applicable
            comment.save()
            return render(request, 'reviews/partials/reviews_action_message.html', {
                'object_type': 'comment',
                'action_type': 'edit',
                'object_list_url': 'review-list'
            })  
    else:
        form = CommentForm(instance=comment)

    return render(request, 'reviews/partials/edit_comment.html', {'form': form, 'comment': comment, 'show_modal': True})



@login_required
def add_comment(request, review_id):
    review = get_object_or_404(Review, pk=review_id)

    if request.method == 'POST':
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.review = review
            comment.user = request.user
            comment.status = Comment.PENDING  # Set comment status to pending
            comment.save()
            # Redirect to the review success page
            return render(request, 'reviews/partials/reviews_action_message.html', {
                'object_type': 'comment',
                'action_type': 'create',
                'object_list_url': 'review-list'
            })  
    else:
        form = CommentForm()

    return render(request, 'add_comment.html', {'form': form, 'review': review})
@staff_member_required
def review_approval_list(request):
    pending_reviews = Review.objects.filter(status=0) 
    return render(request, 'reviews/partials/review_approval_list.html', {'pending_reviews': pending_reviews})


@staff_member_required
def approve_review(request, review_id):
    review = get_object_or_404(Review, id=review_id)
    review.status = 1
    review.save()

    # Create a message for the user
    user = review.user
    message_content = f'Your review has been approved.'
    message = Message(user=user, content=message_content)
    message.save()

    return JsonResponse({'message': 'Review approved successfully'})


@staff_member_required
def reject_review(request, review_id):
    review = get_object_or_404(Review, id=review_id)
    review.status = 2
    review.save()

    # Create a message for the user
    user = review.user
    message_content = f'Your review has been rejected.'
    message = Message(user=user, content=message_content)
    message.save()

    return JsonResponse({'message': 'Review rejected successfully'})



@staff_member_required
def comment_approval_list(request):
    pending_comments = Comment.objects.filter(status=Comment.PENDING)
    return render(request, 'reviews/partials/comment_approval_list.html', {'pending_comments': pending_comments})


@staff_member_required
def approve_comment(request, comment_id):
    comment = get_object_or_404(Comment, id=comment_id)
    comment.status = Comment.APPROVED
    comment.save()

    # Create a message for the user
    user = comment.user  # Assuming Comment model has a 'user' field
    message_content = f'Your comment on "{comment.review.review}" has been approved.'  # Customize as needed
    message = Message(user=user, content=message_content)
    message.save()

    return redirect('comment-approval-list')

@staff_member_required
def reject_comment(request, comment_id):
    comment = get_object_or_404(Comment, id=comment_id)
    comment.status = Comment.REJECTED
    comment.save()

    # Create a message for the user
    user = comment.user  # Assuming Comment model has a 'user' field
    message_content = f'Your comment on "{comment.review.review}" has been rejected.'  # Customize as needed
    message = Message(user=user, content=message_content)
    message.save()

    return redirect('comment-approval-list')

@login_required
def user_pending_reviews_count(request):
    user_pending_reviews_count = Review.objects.filter(user=request.user, status=0).count()
    return user_pending_reviews_count

@login_required
def user_pending_comments_count(request):
    user_pending_comments_count = Comment.objects.filter(user=request.user, status='pending').count()
    return user_pending_comments_count