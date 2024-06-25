from django import forms
from django.utils.safestring import mark_safe

class StarRatingWidget(forms.Widget):
    def render(self, name, value, attrs=None, renderer=None):
        if value is None:
            value = 0

        html = f'''
        <div class="star-rating" data-name="{name}">
        '''
        for i in range(1, 6):
            checked = 'checked' if i <= value else ''
            html += f'<span class="fa fa-star {checked}" data-value="{i}"></span>'

        html += f'<input type="hidden" name="{name}" value="{value}">'
        html += '''
        </div>
        <script>
        document.addEventListener("DOMContentLoaded", function() {
            const stars = document.querySelectorAll('.star-rating[data-name="{name}"] .fa-star');
            stars.forEach(star => {
                star.addEventListener('click', function() {
                    const value = this.getAttribute('data-value');
                    const hiddenInput = this.closest('.star-rating').querySelector('input[type="hidden"]');
                    hiddenInput.value = value;

                    stars.forEach(s => s.classList.remove('checked'));
                    for (let i = 0; i < value; i++) {
                        stars[i].classList.add('checked');
                    }
                });
            });
        });
        </script>
        '''
        return mark_safe(html)
