from django.db import models
from django.contrib.auth.models import User


STATUS = ((0, "Draft"), (1, "Published"))

class Booking(models.Model):
    ROOM_TYPES = [
        ('deluxe', 'Deluxe Room'),
        ('superior', 'Superior Room'),
        ('standard', 'Standard Room'),
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    email = models.EmailField()
    phone = models.CharField(max_length=15)
    checkin_date = models.DateField()
    checkout_date = models.DateField()
    type_of_room = models.CharField(max_length=10, choices=ROOM_TYPES)
    occupied = models.BooleanField(default=False)
    status = models.IntegerField(choices=STATUS, default=0)
    excerpt = models.TextField(blank=True)
    updated_on = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.name} - {self.checkin_date} to {self.checkout_date}'

from django.db import models

class Room(models.Model):
    ROOM_TYPES = [
        ('deluxe', 'Deluxe Room'),
        ('superior', 'Superior Room'),
        ('standard', 'Standard Room'),
    ]

    room_number = models.CharField(max_length=20, unique=True)  # Unique identifier for the room
    room_type = models.CharField(max_length=10, choices=ROOM_TYPES)  # Type of the room
    description = models.TextField()  # Description of the room
    capacity = models.PositiveIntegerField(default=1)  # Maximum occupancy of the room
    price = models.DecimalField(max_digits=10, decimal_places=2)  # Price per night
    available = models.BooleanField(default=True)  # Availability status of the room

    # Additional fields like images, booking history, cleaning status, etc., can be added here

    def __str__(self):
        return f"{self.room_type} - {self.room_number}"
