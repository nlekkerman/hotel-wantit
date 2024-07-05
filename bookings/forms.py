from django import forms
from .models import Room, Reservation
from django.core.exceptions import ValidationError
from datetime import date


class AvailabilityForm(forms.Form):
    """
    Form for checking room availability based on check-in and check-out dates.

    Attributes:
        check_in (DateField): Field for entering the check-in date.
        check_out (DateField): Field for entering the check-out date.

    Methods:
        clean(): Validates the form data to ensure check-in
        and check-out dates are valid.
                 Raises a ValidationError if the dates are missing
                 or if check-out date is before check-in date.
    """

    check_in = forms.DateField(
        widget=forms.DateInput(
            attrs={
                "type": "date",
                "class": "form-control",
                "min": date.today().strftime("%Y-%m-%d"),
            }
        ),
        required=True,
    )
    check_out = forms.DateField(
        widget=forms.DateInput(
            attrs={"type": "date", "class": "form-control"}
        ),
        required=True,
    )

    def clean(self):
        """
        Validates the form data.

        Raises:
            ValidationError: If check-in date is missing
            or check-out date is missing or before check-in date.
        """
        cleaned_data = super().clean()
        check_in = cleaned_data.get("check_in")
        check_out = cleaned_data.get("check_out")

        if not check_in:
            self.add_error("check_in", "Check-In date is required.")
        if not check_out:
            self.add_error("check_out", "Check-Out date is required.")
        elif check_in and check_out and check_in >= check_out:
            self.add_error(
                "check_out", "Check-Out date must be after Check-In date."
            )
        return cleaned_data


class ReservationForm(forms.ModelForm):
    """
    Form for making a reservation.

    Fields:
        name (CharField): Name of the guest making the reservation.
        email (EmailField): Email address of the guest.
        phone (CharField): Phone number of the guest.
        checkin_date (DateField): Date of check-in for the reservation.
        checkout_date (DateField): Date of check-out for the reservation.

    Meta:
        model (Reservation): Specifies the model linked to this form.
        fields (list): List of fields from the Reservation model
        to include in the form.
    """

    class Meta:
        model = Reservation
        fields = ["name", "email", "phone", "checkin_date", "checkout_date"]
        widgets = {
            'checkin_date': forms.DateInput(
                attrs={
                    "type": "date",
                    "class": "form-control",
                    "min": date.today().strftime("%Y-%m-%d"),
                }
            ),
            'checkout_date': forms.DateInput(
                attrs={"type": "date", "class": "form-control"}
            ),
        }

    def clean(self):
        """
        Validates the form data.

        Raises:
            ValidationError: If check-in date is missing
            or check-out date is missing or before check-in date.
        """
        cleaned_data = super().clean()
        checkin_date = cleaned_data.get("checkin_date")
        checkout_date = cleaned_data.get("checkout_date")

        if not checkin_date:
            self.add_error("checkin_date", "Check-In date is required.")
        if not checkout_date:
            self.add_error("checkout_date", "Check-Out date is required.")
        elif checkin_date and checkout_date and checkin_date >= checkout_date:
            self.add_error(
                "checkout_date", "Check-Out date must be after Check-In date."
            )
        return cleaned_data