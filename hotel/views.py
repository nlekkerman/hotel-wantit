from django.shortcuts import render, get_object_or_404
from bookings.models import Reservation
from reviews.models import Review, Comment
from django.http import JsonResponse
from bookings.models import Reservation
from home.models import Message
from django.contrib.auth.decorators import login_required

@login_required
def user_notifications(request):
  
    user_reservations = Reservation.objects.filter(user=request.user).order_by('-reservation_status')
    user_pending_reviews = Review.objects.filter(user=request.user, status=0)
    user_pending_comments = Comment.objects.filter(user=request.user, status='pending')
    user_messages = Message.objects.filter(user=request.user).order_by('-timestamp')

    return render(request, 'notifications.html', {
        'user_reservations': user_reservations,
        'user_pending_reviews': user_pending_reviews,
        'user_pending_comments': user_pending_comments,
        'user_messages': user_messages,
    })
def admin_dashboard(request):
    pending_reviews = Review.objects.filter(status=0).count()
    pending_comments = Comment.objects.filter(status='pending').count()
    pending_reservations = Reservation.objects.filter(reservation_status='pending').count()

    total_pending = pending_reviews + pending_comments + pending_reservations

    context = {
        'pending_reviews': pending_reviews,
        'pending_comments': pending_comments,
        'pending_reservations': pending_reservations,
        'total_pending': total_pending
    }

    # Construct a JSON response with your context data
    return JsonResponse(context)

def admin_interface(request):
    context = {
        'title': 'Admin Interface',
        # Add any other context variables you need
    }
    return render(request, 'admin_interface.html', context)


def close_message_view(request, message_id):
    # Retrieve the message object or return a 404 error if not found
    message = get_object_or_404(Message, id=message_id)

    # Delete the message
    message.delete()

    # Return a JSON response indicating success
    return JsonResponse({'message': f'Message {message_id} deleted successfully'})