from django.db import models
from django.contrib.auth.models import User


class Message(models.Model):
    """
    Model representing a message sent by a user.

    Attributes:
        user (User): The user who sent the message.
        content (str): The content of the message.
        timestamp (datetime): The timestamp when the message was created.
    """

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    content = models.TextField()
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.content
