from .views import home_view  # Ensure this import is correct
from django.urls import path

urlpatterns = [
    path('', home_view, name='home'),
]

