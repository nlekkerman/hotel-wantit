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
    """
    Renders a list of reviews that are approved, ordered by creation date,
    and annotates each review with the count of approved comments.
    """

    template_name = "review_list.html"
    paginate_by = 6

    def get_queryset(self):
        """
        Returns queryset of all approved reviews, ordered by creation date.
        """

        queryset = Review.objects.filter(status=1).order_by("-created_at")

        for review in queryset:
            review.comment_count = review.comments.filter(
                status="approved"
            ).count()
        return queryset

    def get_context_data(self, **kwargs):
        """
        Adds context data to the view, extending superclass method.
        """
        context = super().get_context_data(**kwargs)
        return context


def review_detail(request, pk):
    """
    Renders detailed view of a specific review, handling comment submission,
    and displaying approved comments.
    """
    review = get_object_or_404(Review, pk=pk)
    comment_count = review.comments.filter(status=Comment.APPROVED).count()

    if request.method == "POST":
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.review = review
            comment.user = request.user
            comment.status = Comment.PENDING  # Set status to pending
            comment.save()
            messages.success(
                request,
                "Your comment has been submitted and is pending approval.",
            )
            return redirect("review_detail", pk=review.id)
    else:
        form = CommentForm()
    approved_comments = review.comments.filter(status=Comment.APPROVED)

    return render(
        request,
        "reviews/review_detail.html",
        {
            "review": review,
            "form": form,
            "comments": approved_comments,
            "comment_count": comment_count,
        },
    )


@login_required
def create_review(request):
    """
    Handles creation of a new review,

    with optional AJAX handling for star ratings.
    """
    if request.method == "POST":
        form = ReviewForm(request.POST)
        if form.is_valid():
            review = form.save(commit=False)
            review.user = request.user
            review.status = 0  # Assuming 0 means pending approval
            review.save()

            # Handle AJAX request to log star rating if present

            if request.headers.get("x-requested-with") == "XMLHttpRequest":
                data = json.loads(request.body)
                rating = data.get("rating")

                print(f"Star rating received: {rating}")
                return JsonResponse({"status": "success", "rating": rating})
            messages.success(request, "Review submitted successfully!")
            return redirect(
                "review_success"
            )  # Redirect to the review success message
        else:
            messages.error(
                request, "Error submitting review. Please correct the errors."
            )
    else:
        form = ReviewForm()
    return render(request, "reviews/create_review.html", {"form": form})


@csrf_exempt
def log_star_rating(request):
    """
    Logs star rating received via POST request.
    """
    if request.method == "POST":
        data = json.loads(request.body)
        rating = data.get("rating")
        print(f"Star rating received: {rating}")
        return JsonResponse({"status": "success", "rating": rating})
    return JsonResponse({"status": "fail"}, status=400)


def review_success_message(request):
    """
    Renders success message for review submission.
    """
    return render(request, "reviews/partials/review_success_message.html")


@login_required
def edit_review(request, pk):
    """
    Allows authorized users to edit their own review.
    If the user is not the author
    of the review, redirects them to the detailed view of the review.

    Args:
        request (HttpRequest): The HTTP request object.
        pk (int): The primary key of the review to be edited.

    Returns:
        HttpResponse: Renders the edit review form if it's a GET request,
        processes
        form submission and updates the review if it's a POST request.
        On successful
        update, renders a success message; otherwise,
        re-renders the edit form with
        validation errors.

        If unauthorized, redirects to the detailed view of the review.

    Raises:
        Http404: If the requested review does not exist.

    """
    review = get_object_or_404(Review, pk=pk)

    if request.user != review.user:
        return redirect("review_detail", pk=pk)
    if request.method == "POST":
        form = ReviewForm(request.POST, instance=review)
        if form.is_valid():
            review = form.save(commit=False)
            review.status = 0
            review.last_edited_at = timezone.now()
            review.save()
            return render(
                request,
                "reviews/partials/reviews_action_message.html",
                {
                    "object_type": "review",
                    "action_type": "edit",
                    "object_list_url": "review-list",
                },
            )
    else:
        form = ReviewForm(instance=review)
    return render(
        request,
        "reviews/edit_review.html",
        {"form": form, "review": review, "show_modal": True},
    )


@login_required
def delete_review(request, pk):
    """
    Allows authorized users to delete their own review.
    If the request method is POST,
    the review is deleted
    and a success message is rendered.
    If the request method is
    not POST, redirects to the review list.

    Args:
        request (HttpRequest): The HTTP request object.
        pk (int): The primary key of the review to be deleted.

    Returns:
        HttpResponse:
        Redirects to the review list
        if the review is deleted successfully;
        otherwise, redirects to the review detail page.

        If unauthorized, redirects to the detailed view of the review.

    Raises:
        Http404: If the requested review does not exist.
    """
    review = get_object_or_404(Review, pk=pk)

    # Check if the current user is the author of the review

    if request.user != review.user:
        return redirect(
            "review_detail", pk=pk
        )  # Redirect or handle unauthorized access
    if request.method == "POST":
        review.delete()
        return render(
            request,
            "reviews/partials/reviews_action_message.html",
            {
                "object_type": "review",
                "action_type": "delete",
                "object_list_url": "review-list",
            },
        )
    # If not a POST request, simply redirect to review-list

    return redirect("review-list")


@login_required
def delete_comment(request, pk):
    """
    Allows authorized users to delete
    their own comment. If the request method is POST,
    the comment is deleted and a success message is rendered.
    If the request method is
    not POST, the comment is displayed on a confirmation page.

    Args:
        request (HttpRequest): The HTTP request object.
        pk (int): The primary key of the comment to be deleted.

    Returns:
        HttpResponse:
        Renders a confirmation page if not a POST request;
        renders a success
        message if the comment is deleted successfully.
    """
    comment = get_object_or_404(Comment, pk=pk)
    if request.method == "POST":
        comment.delete()
        return render(
            request,
            "reviews/partials/reviews_action_message.html",
            {
                "object_type": "comment",
                "action_type": "delete",
                "object_list_url": "review-list",
            },
        )
    # If not POST request, render delete confirmation page

    return render(request, "reviews/delete_comment.html", {"comment": comment})


@login_required
def edit_comment(request, pk):
    """
    Allows authorized users
    to edit their own comment.
    If the user is not the author
    of the comment, redirects them to the comment detail view.
    If the request method is
    POST, processes the form and updates the comment. Otherwise,
    renders the comment edit
    form.

    Args:
        request (HttpRequest): The HTTP request object.
        pk (int): The primary key of the comment to be edited.

    Returns:
        HttpResponse: Renders the comment edit form if it's a GET request,
        processes
        form submission and updates the comment
        if it's a POST request.
        On successful
        update, renders a success message.
        Redirects unauthorized users to the comment detail view.
    """
    comment = get_object_or_404(Comment, pk=pk)

    if request.user != comment.user:
        return redirect("comment_detail", pk=pk)
    if request.method == "POST":
        form = CommentForm(request.POST, instance=comment)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.status = Comment.PENDING
            comment.last_edited_at = timezone.now()
            comment.save()
            return render(
                request,
                "reviews/partials/reviews_action_message.html",
                {
                    "object_type": "comment",
                    "action_type": "edit",
                    "object_list_url": "review-list",
                },
            )
    else:
        form = CommentForm(instance=comment)
    return render(
        request,
        "reviews/partials/edit_comment.html",
        {"form": form, "comment": comment, "show_modal": True},
    )


@login_required
def add_comment(request, review_id):
    """
    Handles submission of a new comment for a specific review.
    If the request method is
    POST, processes the form and saves the new comment.
    Otherwise, renders the comment form.

    Args:
        request (HttpRequest): The HTTP request object.
        review_id (int):
        The primary key of the review to which the comment is added.

    Returns:
        HttpResponse: Renders the comment form if it's a GET request,
        processes form submission
        and saves the new comment if it's a POST request.
        On successful addition, renders a success
        message.
    """
    review = get_object_or_404(Review, pk=review_id)

    if request.method == "POST":
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.review = review
            comment.user = request.user
            comment.status = Comment.PENDING  # Set comment status to pending
            comment.save()
            # Redirect to the review success page

            return render(
                request,
                "reviews/partials/reviews_action_message.html",
                {
                    "object_type": "comment",
                    "action_type": "create",
                    "object_list_url": "review-list",
                },
            )
    else:
        form = CommentForm()
    return render(
        request, "add_comment.html", {"form": form, "review": review}
    )


@staff_member_required
def review_approval_list(request):
    """
    Renders a list of pending reviews for staff approval.
    Fetches all reviews with a status of 0
    (pending approval) and passes them to the template.

    Args:
        request (HttpRequest): The HTTP request object.

    Returns:
        HttpResponse: Renders the review approval list template
        with the list of pending reviews.
    """
    pending_reviews = Review.objects.filter(status=0)
    return render(
        request,
        "reviews/partials/review_approval_list.html",
        {"pending_reviews": pending_reviews},
    )


@staff_member_required
def approve_review(request, review_id):
    """
    Approves a pending review and sends a notification message to the user.
    Fetches the review by its
    ID, updates its status to approved,
    and creates a notification message for the review's author.

    Args:
        request (HttpRequest): The HTTP request object.
        review_id (int): The primary key of the review to be approved.

    Returns:
        JsonResponse: Returns a JSON response indicating success.
    """
    review = get_object_or_404(Review, id=review_id)
    review.status = 1
    review.save()

    # Create a message for the user

    user = review.user
    message_content = f"Your review has been approved."
    message = Message(user=user, content=message_content)
    message.save()

    return JsonResponse({"message": "Review approved successfully"})


@staff_member_required
def reject_review(request, review_id):
    """
    Rejects a pending review and sends a notification message to the user.
    Fetches the review by its
    ID, updates its status to rejected,
    and creates a notification message for the review's author.

    Args:
        request (HttpRequest): The HTTP request object.
        review_id (int): The primary key of the review to be rejected.

    Returns:
        JsonResponse: Returns a JSON response indicating success.
    """
    review = get_object_or_404(Review, id=review_id)
    review.status = 2
    review.save()

    # Create a message for the user

    user = review.user
    message_content = f"Your review has been rejected."
    message = Message(user=user, content=message_content)
    message.save()

    return JsonResponse({"message": "Review rejected successfully"})


@staff_member_required
def comment_approval_list(request):
    """
    Renders a list of pending comments for staff approval.
    Fetches all comments with a status of
    Comment.PENDING and passes them to the template.

    Args:
        request (HttpRequest): The HTTP request object.

    Returns:
        HttpResponse: Renders the comment approval list template,
        with the list of pending comments.
    """
    pending_comments = Comment.objects.filter(status=Comment.PENDING)
    return render(
        request,
        "reviews/partials/comment_approval_list.html",
        {"pending_comments": pending_comments},
    )


@staff_member_required
def approve_comment(request, comment_id):
    """
    Approves a pending comment and sends a notification message to the user.
    Fetches the comment by its
    ID, updates its status to approved,
    and creates a notification message for the comment's author.

    Args:
        request (HttpRequest): The HTTP request object.
        comment_id (int): The primary key of the comment to be approved.

    Returns:
        HttpResponse: Redirects to the comment approval list
        after approving the comment.
    """
    comment = get_object_or_404(Comment, id=comment_id)
    comment.status = Comment.APPROVED
    comment.save()

    user = comment.user
    message_content = (
        f'Your comment on "{comment.review.review}" has been approved.'
    )
    message = Message(user=user, content=message_content)
    message.save()

    return redirect("comment-approval-list")


@staff_member_required
def reject_comment(request, comment_id):
    """
    Rejects a pending comment and sends a notification message to the user.
    Fetches the comment by its
    ID, updates its status to rejected,
    and creates a notification message for the comment's author.

    Args:
        request (HttpRequest): The HTTP request object.
        comment_id (int): The primary key of the comment to be rejected.

    Returns:
        HttpResponse: Redirects to the comment approval list
        after rejecting the comment.
    """
    comment = get_object_or_404(Comment, id=comment_id)
    comment.status = Comment.REJECTED
    comment.save()

    # Create a message for the user

    user = comment.user  # Assuming Comment model has a 'user' field
    message_content = (
        f'Your comment on "{comment.review.review}"'f'has been rejected.'
        )

    message = Message(user=user, content=message_content)
    message.save()

    return redirect("comment-approval-list")


@login_required
def user_pending_reviews_count(request):
    """
    Counts the number of pending reviews for the logged-in user.
    Queries the database for reviews
    created by the current user with a status of 0 (pending approval).

    Args:
        request (HttpRequest): The HTTP request object.

    Returns:
        int: The count of pending reviews for the logged-in user.
    """
    user_pending_reviews_count = Review.objects.filter(
        user=request.user, status=0
    ).count()
    return user_pending_reviews_count


@login_required
def user_pending_comments_count(request):
    """
    Counts the number of pending comments for the logged-in user.
    Queries the database for comments
    created by the current user with a status of 'pending'.

    Args:
        request (HttpRequest): The HTTP request object.

    Returns:
        int: The count of pending comments for the logged-in user.
    """
    user_pending_comments_count = Comment.objects.filter(
        user=request.user, status="pending"
    ).count()
    return user_pending_comments_count
