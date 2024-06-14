from datetime import timedelta

def calculate_price(room, checkin_date, checkout_date):
    # Example calculation: simple daily rate * number of days
    price_per_night = room.price
    num_days = (checkout_date - checkin_date).days
    total_price = price_per_night * num_days
    return total_price