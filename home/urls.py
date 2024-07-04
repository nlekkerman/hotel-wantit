from .views import home_view 
from django.urls import path
from . import views  


urlpatterns = [
    path("", home_view, name="home"),
    path(
        "renovated_rooms/",
        views.show_renovated_rooms,
        name="show_renovated_rooms",
    ),
]
