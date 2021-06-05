from django.contrib import admin

from .models import Rules
from django import forms
from tinymce.widgets import TinyMCE

class AdminRulesForm(forms.ModelForm):

    class Meta:
        model = Rules
        exclude = []
        widgets = {
            'content': TinyMCE(attrs={'cols': 80, 'rows': 30})
        }


class AdminRules(admin.ModelAdmin):
    form = AdminRulesForm
    
    class Admin:
        js = ('static/plugins/tinymce/tinymce.min.js', )

    def has_add_permission(self, request, obj=None):
        return False

    def has_delete_permission(self, request, obj=None):
        return False

    def get_changelist(self, request, **kwargs):
        if self.model.objects.all().count() == 0:
            self.model.objects.create()
        return super(AdminRules, self).get_changelist(request, **kwargs)

admin.site.register(Rules, AdminRules)
