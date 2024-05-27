from django.contrib import admin
from .models import Review
from django_summernote.admin import SummernoteModelAdmin

@admin.register(Review)
class ReviewAdmin(SummernoteModelAdmin):

    search_fields = ['rating']
    list_filter = ('status',)
    summernote_fields = ('review',)



# Register your models here.
