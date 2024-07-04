
from django.contrib import admin
from django.urls import path, include
from django.views.generic import TemplateView
from reviews import views as reviews_views
from home import views as home_views
from bookings import views as bookings_views
from django.conf.urls import handler404
from . import views as root_views
from django_summernote import urls as summernote_urls
from . import views

urlpatterns = [
    path(
        "notifications/",
        root_views.user_notifications,
        name="user-notifications",
    ),
    path("", include("home.urls")),
    path("accounts/", include("allauth.urls")),
    path("admin/", admin.site.urls),
    path("summernote/", include(summernote_urls)),
    path("reviews/", include("reviews.urls")),
    path("bookings/", include("bookings.urls")),
    path(
        "admin_dashboard/", root_views.admin_dashboard, name="admin_dashboard"
    ),
    path(
        "close-message/<int:message_id>/",
        views.close_message_view,
        name="close_message",
    ),
    path("admin-interface/", views.admin_interface, name="admin-interface"),
]

handler404 = 'hotel.views.custom_404'
