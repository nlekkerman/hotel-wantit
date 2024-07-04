from datetime import timedelta


def calculate_price(room, checkin_date, checkout_date):
    """
    Calculate total price for a reservation
    based on room price and duration.

    Parameters:
    - room: Room object for which the price is calculated.
    - checkin_date: Check-in date for the reservation.
    - checkout_date: Check-out date for the reservation.

    Returns:
    - total_price: Total price for the reservation.
    """
    price_per_night = room.price
    num_days = (checkout_date - checkin_date).days
    total_price = price_per_night * num_days
    return total_price
