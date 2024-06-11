from django.urls import path
from . import views 
from .views import send_confirmation_email, check_availability, reservation_success

urlpatterns = [
    path('rooms/reserve-room/<int:room_id>/', views.reserve_room, name='reserve_room'),
    path('check_availability/', check_availability, name='check_availability'),
    path('reservation_success/<int:reservation_id>/', reservation_success, name='reservation_success'),
    path('', views.book_room, name='book_room'),
    path('rooms/', views.rooms_view, name='rooms'),
    path('send-email/', send_confirmation_email, name='send_email'),
]
