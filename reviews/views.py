from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from django.contrib.admin.views.decorators import staff_member_required
from .forms import ReviewForm, CommentForm
from django.db.models import Count, Q
from django.views import generic
from .models import Review, Comment



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
            return redirect('review_success')  # Redirect to the review success message
    else:
        form = ReviewForm()

    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        return render(request, 'reviews/create_review.html', {'form': form})

    return render(request, 'reviews/create_review.html', {'form': form})

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
            return render(request, 'reviews/partials/review_edit_message.html')  
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

        # After deletion, render review_delete_message.html
        return render(request, 'reviews/partials/review_delete_message.html')

    # If not a POST request, simply redirect to review-list
    return redirect('review-list')   


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
            messages.success(request, 'Your comment has been submitted and is pending approval.')
            return redirect('review_detail', pk=review_id)  # Redirect to review detail page
    else:
        form = CommentForm()
    
    # If the form is invalid or it's not a POST request, render the template with the form
    return render(request, 'add_comment.html', {'form': form, 'review': review})


@staff_member_required
def review_approval_list(request):
    pending_reviews = Review.objects.filter(status=0) 
    return render(request, 'reviews/review_approval_list.html', {'pending_reviews': pending_reviews})

@staff_member_required
def approve_review(request, review_id):
    review = get_object_or_404(Review, id=review_id)
    review.status = 1  # Approve the review
    review.save()
    return redirect('review-approval-list')

@staff_member_required
def reject_review(request, review_id):
    review = get_object_or_404(Review, id=review_id)
    review.status = 2  # Reject the review
    review.save()
    return redirect('review-approval-list')



@staff_member_required
def comment_approval_list(request):
    pending_comments = Comment.objects.filter(status=Comment.PENDING)
    return render(request, 'reviews/comment_approval_list.html', {'pending_comments': pending_comments})

@staff_member_required
def approve_comment(request, comment_id):
    comment = get_object_or_404(Comment, id=comment_id)
    comment.status = Comment.APPROVED
    comment.save()
    pending_comments = Comment.objects.filter(status=Comment.PENDING)
    return render(request, 'reviews/comment_approval_list.html', {'pending_comments': pending_comments})

@staff_member_required
def reject_comment(request, comment_id):
    comment = get_object_or_404(Comment, id=comment_id)
    comment.status = Comment.REJECTED
    comment.save()
    pending_comments = Comment.objects.filter(status=Comment.PENDING)
    return render(request, 'reviews/comment_approval_list.html', {'pending_comments': pending_comments})


@login_required
def user_pending_reviews_count(request):
    user_pending_reviews_count = Review.objects.filter(user=request.user, status=0).count()
    return user_pending_reviews_count

@login_required
def user_pending_comments_count(request):
    user_pending_comments_count = Comment.objects.filter(user=request.user, status='pending').count()
    return user_pending_comments_count