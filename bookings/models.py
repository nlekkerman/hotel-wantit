from django.db import models
from django.contrib.auth.models import User
from cloudinary.models import CloudinaryField
from .utils import calculate_price


class Room(models.Model):
    ROOM_TYPES = [
        ('deluxe', 'Deluxe Room'),
        ('superior', 'Superior Room'),
        ('standard', 'Standard Room'),
    ]

    room_number = models.CharField(max_length=20, unique=True)  # Unique identifier for the room
    featured_image = CloudinaryField('image', default='placeholder')
    room_type = models.CharField(max_length=10, choices=ROOM_TYPES)  # Type of the room
    description = models.TextField()  # Description of the room
    capacity = models.PositiveIntegerField(default=1)  # Maximum occupancy of the room
    price = models.DecimalField(max_digits=10, decimal_places=2)  # Price per night
    available = models.BooleanField(default=True)  # Availability status of the room

    # Additional fields like images, booking history, cleaning status, etc., can be added here

    def __str__(self):
        return f"{self.room_type} - {self.room_number}"


class Reservation(models.Model):

    PENDING = 'pending'
    CONFIRMED = 'confirmed'
    REJECTED = 'rejected'
    
    STATUS_CHOICES = [
        (PENDING, 'Pending'),
        (CONFIRMED, 'Confirmed'),
        (REJECTED, 'Rejected'),
    ]

    ROOM_TYPES = [
        ('deluxe', 'Deluxe Room'),
        ('superior', 'Superior Room'),
        ('standard', 'Standard Room'),
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    room = models.ForeignKey(Room, on_delete=models.CASCADE, null=True, default=None)
    name = models.CharField(max_length=100)
    email = models.EmailField()
    phone = models.CharField(max_length=15)
    checkin_date = models.DateField()
    checkout_date = models.DateField()
    type_of_room = models.CharField(max_length=10, choices=ROOM_TYPES)
    price = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    reservation_status = models.CharField(max_length=20, choices=STATUS_CHOICES, default=PENDING)

    def save(self, *args, **kwargs):
        # Calculate the price before saving
        if not self.pk:  # Check if this is a new reservation
            self.price = calculate_price(self.room, self.checkin_date, self.checkout_date)
        super().save(*args, **kwargs)

    def cancel(self):
        # Method to cancel the reservation
        self.reservation_status = self.PENDING  # Example: Update status to 'Rejected'
        self.save()

    def __str__(self):
        return f"Reservation #{self.id} - {self.user.username}"