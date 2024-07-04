from django.contrib import admin
from django.urls import path
from django.shortcuts import render, get_object_or_404, redirect
from django.urls import reverse
from django.utils.html import format_html
from .models import Review, Comment
from django_summernote.admin import SummernoteModelAdmin

# Registering Review model with SummernoteModelAdmin
@admin.register(Review)
class ReviewAdmin(SummernoteModelAdmin):
    """
    Customizes the admin interface for Review model using SummernoteModelAdmin.
    """

    search_fields = ['rating']
    list_filter = ('status',)
    summernote_fields = ('review',)


# Customizing admin interface for Comment model
class CommentAdmin(admin.ModelAdmin):
    """
    Customizes the admin interface for Comment model.
    """

    list_filter = ('status',)

    def get_urls(self):
        """
        Adds custom URLs to the admin interface for comment approval.

        Returns:
            list: List of custom URL patterns for the admin interface.
        """
        urls = super().get_urls()
        custom_urls = [
            path('approval/', self.admin_site.admin_view(self.comment_approval_list), name='comment-approval-list'),
        ]
        return custom_urls + urls

    def comment_approval_list(self, request):
        """
        Renders a list of pending comments for staff approval.

        Args:
            request (HttpRequest): The HTTP request object.

        Returns:
            HttpResponse: Renders the comment approval list page with pending comments.
        """
        pending_comments = Comment.objects.filter(status=Comment.PENDING)
        context = dict(
            self.admin_site.each_context(request),
            pending_comments=pending_comments,
        )
        return render(request, 'admin/comment_approval_list.html', context)

    def approve_comment(self, request, comment_id):
        """
        Approves a pending comment.

        Args:
            request (HttpRequest): The HTTP request object.
            comment_id (int): The ID of the comment to be approved.

        Returns:
            HttpResponseRedirect: Redirects to the comment approval list after approval.
        """
        comment = get_object_or_404(Comment, id=comment_id)
        comment.status = Comment.APPROVED
        comment.save()
        return redirect('admin:comment-approval-list')

    def reject_comment(self, request, comment_id):
        """
        Rejects a pending comment.

        Args:
            request (HttpRequest): The HTTP request object.
            comment_id (int): The ID of the comment to be rejected.

        Returns:
            HttpResponseRedirect: Redirects to the comment approval list after rejection.
        """
        comment = get_object_or_404(Comment, id=comment_id)
        comment.status = Comment.REJECTED
        comment.save()
        return redirect('admin:comment-approval-list')

    def status_link(self, obj):
        """
        Displays a link to approve a pending comment if it's pending.

        Args:
            obj (Comment): The Comment instance.

        Returns:
            str: HTML link to approve the comment or a status string based on the comment's status.
        """
        if obj.status == Comment.PENDING:
            url = reverse('admin:approve-comment', args=[obj.id])
            return format_html('<a href="{}">Approve</a>', url)
        elif obj.status == Comment.APPROVED:
            return 'Approved'
        elif obj.status == Comment.REJECTED:
            return 'Rejected'
    status_link.short_description = 'Status'

# Registering Comment model with CommentAdmin customization
admin.site.register(Comment, CommentAdmin)
