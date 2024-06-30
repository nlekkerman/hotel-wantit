from django.contrib import admin
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import path, reverse
from django.utils.html import format_html
from .models import Room, Reservation, BathroomImage, MinibarImage

class BathroomImageInline(admin.TabularInline):
    model = BathroomImage
    extra = 1

class MinibarImageInline(admin.TabularInline):
    model = MinibarImage
    extra = 1

class ReservationAdmin(admin.ModelAdmin):
    list_filter = ('reservation_status',)

    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            path('approval/', self.admin_site.admin_view(self.reservation_approval_list), name='reservation-approval-list'),
        ]
        return custom_urls + urls

    def reservation_approval_list(self, request):
        pending_reservations = Reservation.objects.filter(reservation_status=Reservation.PENDING)
        context = dict(
            self.admin_site.each_context(request),
            pending_reservations=pending_reservations,
        )
        return render(request, 'admin/reservation_approval_list.html', context)

    def approve_reservation(self, request, reservation_id):
        reservation = get_object_or_404(Reservation, id=reservation_id)
        reservation.reservation_status = Reservation.APPROVED
        reservation.save()
        return redirect('admin:reservation-approval-list')

    def reject_reservation(self, request, reservation_id):
        reservation = get_object_or_404(Reservation, id=reservation_id)
        reservation.reservation_status = Reservation.REJECTED
        reservation.save()
        return redirect('admin:reservation-approval-list')

    def status_link(self, obj):
        if obj.reservation_status == Reservation.PENDING:
            url = reverse('admin:approve-reservation', args=[obj.id])
            return format_html('<a href="{}">Approve</a>', url)
        elif obj.reservation_status == Reservation.APPROVED:
            return 'Approved'
        elif obj.reservation_status == Reservation.REJECTED:
            return 'Rejected'
    status_link.short_description = 'reservation_status'

admin.site.register(Reservation, ReservationAdmin)
admin.site.register(BathroomImage)
admin.site.register(MinibarImage)

admin.site.register(Room)
