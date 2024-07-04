# forms.py

from django import forms
from allauth.account.forms import SignupForm as AllauthSignupForm
from allauth.account.adapter import get_adapter
from allauth.account.utils import user_email, user_username
from django.contrib.auth import get_user_model

User = get_user_model()

class CustomSignupForm(AllauthSignupForm):
    """
    Custom signup form that extends Allauth's SignupForm to include additional fields for first name and last name.
    
    Fields:
        first_name (CharField): User's first name, required.
        last_name (CharField): User's last name, required.
    
    Methods:
        __init__(self, *args, **kwargs): Initializes the form and adds the email field.
        save(self, request): Saves the user with the additional first name and last name fields.

        __init__:
            Args:
                *args: Variable length argument list.
                **kwargs: Arbitrary keyword arguments.

        save:
            Args:
                request (HttpRequest): The request object.
            
            Returns:
                User: The newly created user object.
    """

    first_name = forms.CharField(max_length=30, label="First Name", required=True)
    last_name = forms.CharField(max_length=30, label="Last Name", required=True)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['email'] = forms.EmailField(label="Email", required=True)

    def save(self, request):
        adapter = get_adapter()
        user = adapter.new_user(request)
        self.cleaned_data['email'] = self.cleaned_data.get('email')
        user_email(user, self.cleaned_data['email'])
        user_username(user, self.cleaned_data.get('username'))
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.save()
        adapter.save_user(request, user, self)
        self.custom_signup(request, user)
        return user
