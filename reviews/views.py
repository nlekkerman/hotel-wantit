from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.admin.views.decorators import staff_member_required
from .forms import ReviewForm
from django.views import generic
from .models import Review

class ReviewList(generic.ListView):
    template_name = "review_list.html"
    paginate_by = 6
    
    def get_queryset(self):
        # Fetch only approved reviews
        queryset = Review.objects.filter(status=1)
        return queryset
    
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



@login_required
def create_review(request):
    if request.method == 'POST':
        form = ReviewForm(request.POST)
        if form.is_valid():
            review = form.save(commit=False)
            review.user = request.user
            review.status = 0  # Set status to 'Pending'
            review.save()
            return redirect('review-list')  # Use the name of the URL pattern
    else:
        form = ReviewForm()

    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        return render(request, 'reviews/create_review.html', {'form': form})
    
    return render(request, 'reviews/create_review.html', {'form': form})
    if request.method == 'POST':
        form = ReviewForm(request.POST)
        if form.is_valid():
            review = form.save(commit=False)
            review.user = request.user
            review.save()
            return redirect('home')  
    else:
        form = ReviewForm()

    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        return render(request, 'reviews/create_review.html', {'form': form})
    
    return render(request, 'reviews/create_review.html', {'form': form})


@staff_member_required
def review_approval_list(request):
    pending_reviews = Review.objects.filter(status=0)  # Get pending reviews
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