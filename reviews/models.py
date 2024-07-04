from django.db import models
from django.contrib.auth.models import User

STATUS = ((0, "Draft"), (1, "Published"))


class Review(models.Model):
    """
    Represents a user's review.

    Fields:
    - user: ForeignKey to User model, the author of the review.
    - rating: PositiveIntegerField for the review's rating.
    - review: TextField containing the content of the review.
    - created_at: DateTimeField for when the review was created.
    - last_edited_at: DateTimeField for the last edit timestamp.
    - status: IntegerField with choices for the status of the review
    (Pending, Approved, Rejected).

    Meta:
    - ordering: Orders reviews by descending created_at.

    Methods:
    - __str__: Returns a string representation of the review.
    """

    STATUS_CHOICES = (
        (0, "Pending"),
        (1, "Approved"),
        (2, "Rejected"),
    )

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    rating = models.PositiveIntegerField()
    review = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    last_edited_at = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS_CHOICES, default=0)

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return (
            f"Review {self.review} by {self.user.username} "
            f"with rating {self.rating}"
        )


class Comment(models.Model):
    """
    Represents a comment on a Review.

    Fields:
    - review: ForeignKey to Review model, related_name 'comments'.
    - user: ForeignKey to User model, the author of the comment.
    - text: TextField containing the content of the comment.
    - created_at: DateTimeField for when the comment was created.
    - status: CharField with choices for the status of the comment
      (Pending, Approved, Rejected).

    Meta:
    - ordering: Orders comments by ascending created_at.

    Methods:
    - __str__: Returns a string representation of the comment.
    """

    PENDING = "pending"
    APPROVED = "approved"
    REJECTED = "rejected"
    STATUS_CHOICES = [
        (PENDING, "Pending"),
        (APPROVED, "Approved"),
        (REJECTED, "Rejected"),
    ]

    review = models.ForeignKey(
        Review, related_name="comments", on_delete=models.CASCADE
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    status = models.CharField(
        max_length=10, choices=STATUS_CHOICES, default=PENDING
    )

    def __str__(self):
        return f"Comment {self.text} by {self.user.username}"
