from django import forms
from .models import Review
from .models import Comment
from .widgets import StarRatingWidget


class ReviewForm(forms.ModelForm):
    """
    Form for creating or editing a review. The rating field is customized
    with a StarRatingWidget.

    Attributes:
        rating (IntegerField): The rating given by the user.
        review (TextField): The review text provided by the user.

    Methods:
        __init__: Customizes the rating widget to use StarRatingWidget and
                  configures the review field's widget to use a textarea with
                  five rows.
    """

    class Meta:
        model = Review
        fields = ["rating", "review"]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields["rating"].widget = StarRatingWidget()
        self.fields["review"].widget = forms.Textarea(attrs={"rows": 5})


class CommentForm(forms.ModelForm):
    """
    Form for creating or editing a comment associated with a review. The text
    field is styled with a custom class and placeholder text.

    Attributes:
        text (TextField): The comment text provided by the user.

    Methods:
        __init__: Configures the text field's widget to use a custom-textarea
                  class and sets a placeholder text prompting the user to enter
                  their comment.
    """

    class Meta:
        model = Comment
        fields = ["text"]
        labels = {
            "text": "",
        }
        widgets = {
            "text": forms.Textarea(
                attrs={
                    "class": "custom-textarea",
                    "placeholder": "Enter your comment...",
                }
            ),
        }
