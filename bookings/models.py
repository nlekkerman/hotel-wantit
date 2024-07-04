from django.db import models
from django.contrib.auth.models import User
from cloudinary.models import CloudinaryField
from .utils import calculate_price


class Room(models.Model):
    """
    Model representing a room in the hotel.

    Attributes:
        room_number (str): Unique identifier for the room.
        featured_image (CloudinaryField): Featured image of the room.
        room_type (str): Type of the room
        (choices: 'deluxe', 'superior', 'standard').
        description (str): Description of the room.
        capacity (int): Maximum occupancy of the room.
        price (Decimal): Price per night for the room.
        available (bool): Availability status of the room.
    """

    ROOM_TYPES = [
        ("deluxe", "Deluxe Room"),
        ("superior", "Superior Room"),
        ("standard", "Standard Room"),
    ]

    room_number = models.CharField(
        max_length=20, unique=True
    )  # Unique identifier for the room
    featured_image = CloudinaryField("image", default="placeholder")
    room_type = models.CharField(
        max_length=10, choices=ROOM_TYPES
    )  # Type of the room
    description = models.TextField()  # Description of the room
    capacity = models.PositiveIntegerField(
        default=1
    )  # Maximum occupancy of the room
    price = models.DecimalField(
        max_digits=10, decimal_places=2
    )  # Price per night
    available = models.BooleanField(
        default=True
    )  # Availability status of the room

    def __str__(self):
        return f"{self.room_type} - {self.room_number}"


class Reservation(models.Model):
    """
    Model representing a reservation made by a user.

    Attributes:
        PENDING (str): Constant for pending reservation status.
        CONFIRMED (str): Constant for confirmed reservation status.
        REJECTED (str): Constant for rejected reservation status.
        STATUS_CHOICES (list): Choices for reservation status.
        ROOM_TYPES (list): Choices for room types.
        user (User): User who made the reservation.
        room (Room): Room reserved.
        first_name (str): First name of the person making the reservation.
        last_name (str): Last name of the person making the reservation.
        name (str): Full name of the person making the reservation.
        email (str): Email of the person making the reservation.
        phone (str): Phone number of the person making the reservation.
        checkin_date (Date): Check-in date of the reservation.
        checkout_date (Date): Check-out date of the reservation.
        type_of_room (str): Type of room reserved
        (choices: 'deluxe', 'superior', 'standard').
        price (Decimal): Price of the reservation.
        reservation_status (str): Status of the reservation
        (choices: 'pending', 'confirmed', 'rejected').
        status_changed (bool):
        Indicates if the status of the reservation has been changed.
    """

    PENDING = "pending"
    CONFIRMED = "confirmed"
    REJECTED = "rejected"

    STATUS_CHOICES = [
        (PENDING, "Pending"),
        (CONFIRMED, "Confirmed"),
        (REJECTED, "Rejected"),
    ]

    ROOM_TYPES = [
        ("deluxe", "Deluxe Room"),
        ("superior", "Superior Room"),
        ("standard", "Standard Room"),
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    room = models.ForeignKey(
        Room, on_delete=models.CASCADE, null=True, default=None
    )
    first_name = models.CharField(max_length=30)  # New field
    last_name = models.CharField(max_length=30)  # New field
    name = models.CharField(max_length=100)
    email = models.EmailField()
    phone = models.CharField(max_length=15)
    checkin_date = models.DateField()
    checkout_date = models.DateField()
    type_of_room = models.CharField(max_length=10, choices=ROOM_TYPES)
    price = models.DecimalField(
        max_digits=10, decimal_places=2, null=True, blank=True
    )
    reservation_status = models.CharField(
        max_length=20, choices=STATUS_CHOICES, default=PENDING
    )
    status_changed = models.BooleanField(default=False)

    def save(self, *args, **kwargs):
        # Calculate the price before saving

        if not self.pk:  # Check if this is a new reservation
            self.price = calculate_price(
                self.room, self.checkin_date, self.checkout_date
            )
        super().save(*args, **kwargs)

    def cancel(self):
        # Method to cancel the reservation

        self.reservation_status = self.REJECTED  # Update status to 'Rejected'
        self.save()

    def __str__(self):
        return (
            f"Reservation #{self.id} - {self.user.username} "
            f"({self.first_name} {self.last_name})"
        )


class BathroomImage(models.Model):
    image = CloudinaryField("image")

    def __str__(self):
        return f"Bathroom Image"


class MinibarImage(models.Model):
    image = CloudinaryField("image")

    def __str__(self):
        return f"Minibar Image"
