from django import forms
from .models import Room, Reservation

class ReservationForm(forms.ModelForm):
    class Meta:
        model = Reservation
        fields = ['name', 'email', 'phone', 'checkin_date', 'checkout_date']
        widgets = {
            'checkin_date': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
            'checkout_date': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
        }