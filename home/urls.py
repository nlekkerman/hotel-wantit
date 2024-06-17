from .views import home_view  # Ensure this import is correct
from django.urls import path
from . import views  # Make sure to import your views module


urlpatterns = [
    path('', home_view, name='home'),
    path('renovated_rooms/', views.show_renovated_rooms, name='show_renovated_rooms'),
]

