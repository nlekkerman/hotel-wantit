from django import forms
from .models import Review

class ReviewForm(forms.ModelForm):
    class Meta:
        model = Review
        fields = ['rating', 'review']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['rating'].widget = forms.NumberInput(attrs={'min': 1, 'max': 5})
        self.fields['review'].widget = forms.Textarea(attrs={'rows': 5})
