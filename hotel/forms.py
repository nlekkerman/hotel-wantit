from django import forms
from allauth.account.forms import SignupForm

class CustomSignupForm(SignupForm):
    first_name = forms.CharField(max_length=150, label='First Name', required=True)
    last_name = forms.CharField(max_length=150, label='Last Name', required=True)
    email = forms.EmailField(label='Email', required=True)

    def save(self, request):
        user = super(CustomSignupForm, self).save(request)
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.email = self.cleaned_data['email']
        user.save()
        return user