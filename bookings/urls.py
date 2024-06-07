from django.urls import path
from . import views 

urlpatterns = [
    path('', views.book_room, name='book_room'),
    path('rooms/', views.room_details, name='rooms'),
 
]
