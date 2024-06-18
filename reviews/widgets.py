from django import forms
from django.utils.safestring import mark_safe

class StarRatingWidget(forms.Widget):
    def render(self, name, value, attrs=None, renderer=None):
        # Ensure value defaults to 0 if not provided
        if value is None:
            value = 0

        # Prepare HTML for rendering the widget
        html = '<div class="star-rating">'
        for i in range(1, 6):
            # Add 'checked' class to stars that are less than or equal to value
            checked = 'checked' if i <= value else ''
            html += f'<span class="fa fa-star {checked}" data-value="{i}"></span>'
        html += f'<input type="hidden" name="{name}" value="{value}">'
        html += '</div>'
        return mark_safe(html)
