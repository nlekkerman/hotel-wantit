from django.urls import path
from . import views 


urlpatterns = [
    path('reserve-room/<int:room_id>/', views.reserve_room, name='reserve_room'),
    path('room/<int:room_id>/check/', views.check_availability, name='check_availability'),
    path('', views.book_room, name='book_room'),
    path('rooms/', views.rooms_view, name='rooms'),
    path('reservations/approval/', views.reservation_approval_list, name='reservation-approval-list'),
    path('reservations/approve/<int:reservation_id>/', views.approve_reservation, name='approve-reservation'),
    path('reservations/reject/<int:reservation_id>/', views.reject_reservation, name='reject-reservation')

]
