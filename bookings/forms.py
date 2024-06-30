from django import forms
from .models import Room, Reservation
from django.core.exceptions import ValidationError
from datetime import date




class AvailabilityForm(forms.Form):
    check_in = forms.DateField(
        widget=forms.DateInput(attrs={'type': 'date', 'class': 'form-control', 'min': date.today().strftime('%Y-%m-%d')}),
        required=True,
    )
    check_out = forms.DateField(
        widget=forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
        required=True,
    )

    def clean(self):
        cleaned_data = super().clean()
        check_in = cleaned_data.get('check_in')
        check_out = cleaned_data.get('check_out')

        if not check_in:
            self.add_error('check_in', 'Check-In date is required.')
        if not check_out:
            self.add_error('check_out', 'Check-Out date is required.')
        elif check_in and check_out and check_in >= check_out:
            self.add_error('check_out', 'Check-Out date must be after Check-In date.')

        return cleaned_data

class ReservationForm(forms.ModelForm):
    class Meta:
        model = Reservation
        fields = ['name', 'email', 'phone', 'checkin_date', 'checkout_date']