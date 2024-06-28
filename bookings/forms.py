from django import forms
from .models import Room, Reservation
from django.core.exceptions import ValidationError
from datetime import date




class AvailabilityForm(forms.Form):
    check_in = forms.DateField(
        widget=forms.DateInput(attrs={'type': 'date', 'class': 'form-control', 'min': date.today().strftime('%Y-%m-%d')}),
    )
    check_out = forms.DateField(
        widget=forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
    )

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['check_out'].widget.attrs['min'] = date.today().strftime('%Y-%m-%d')


class ReservationForm(forms.ModelForm):
    class Meta:
        model = Reservation
        fields = ['name', 'email', 'phone', 'checkin_date', 'checkout_date']