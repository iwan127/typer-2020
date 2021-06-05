from django.forms import ModelForm
from django.forms.widgets import NumberInput
from django import forms
from captcha.fields import CaptchaField

from . import models as pre_m

class PredictionForm(ModelForm):
#     forms.
    captcha = CaptchaField()

    class Meta:
        model = pre_m.Prediction
        fields = ['goals_home', 'goals_away', ]
        widgets = {
            'goals_home': NumberInput(min_value=0),
            'goals_away': NumberInput(min_value=0)
        }
