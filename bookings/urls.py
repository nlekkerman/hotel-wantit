from django.urls import path
from . import views 


urlpatterns = [
    path('rooms/reserve-room/', views.reserve_room, name='reserve_room'),
    path('reservation-success/<int:reservation_id>/', views.reservation_success, name='reservation_success'),
    path('', views.book_room, name='book_room'),
    path('rooms/', views.rooms_view, name='rooms'),
]
