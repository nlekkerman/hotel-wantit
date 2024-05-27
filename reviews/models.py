from django.db import models
from django.contrib.auth.models import User

STATUS = ((0, "Draft"), (1, "Published"))


class Review(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    rating = models.PositiveIntegerField()
    review = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    last_edited_at = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)


    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"Review {self.review} by {self.user.username} with rating {self.rating}"