from django.contrib import admin

from .models import Team
from django import forms
from utils.svgimagefield import SVGAndImageFormField

class TeamAdminForm(forms.ModelForm):
    class Meta:
        model = Team
        exclude = []
        field_classes = {
            'logo': SVGAndImageFormField,
        }

class TeamAdmin(admin.ModelAdmin):
    form = TeamAdminForm

admin.site.register(Team, TeamAdmin)
