from django.contrib import admin
from django.urls import path
from .models import Review, Comment
from django_summernote.admin import SummernoteModelAdmin

@admin.register(Review)
class ReviewAdmin(SummernoteModelAdmin):

    search_fields = ['rating']
    list_filter = ('status',)
    summernote_fields = ('review',)


class CommentAdmin(admin.ModelAdmin):
    list_filter = ('status',)

    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            path('approval/', self.admin_site.admin_view(self.comment_approval_list), name='comment-approval-list'),
        ]
        return custom_urls + urls

    def comment_approval_list(self, request):
        pending_comments = Comment.objects.filter(status=Comment.PENDING)
        context = dict(
            self.admin_site.each_context(request),
            pending_comments=pending_comments,
        )
        return render(request, 'admin/comment_approval_list.html', context)

    def approve_comment(self, request, comment_id):
        comment = get_object_or_404(Comment, id=comment_id)
        comment.status = Comment.APPROVED
        comment.save()
        return redirect('admin:comment-approval-list')

    def reject_comment(self, request, comment_id):
        comment = get_object_or_404(Comment, id=comment_id)
        comment.status = Comment.REJECTED
        comment.save()
        return redirect('admin:comment-approval-list')

    def status_link(self, obj):
        if obj.status == Comment.PENDING:
            url = reverse('admin:approve-comment', args=[obj.id])
            return format_html('<a href="{}">Approve</a>', url)
        elif obj.status == Comment.APPROVED:
            return 'Approved'
        elif obj.status == Comment.REJECTED:
            return 'Rejected'
    status_link.short_description = 'Status'

# Register your models here.
admin.site.register(Comment, CommentAdmin)