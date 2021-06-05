from django.apps import AppConfig
from django.utils.translation import ugettext_lazy as _


class MatchConfig(AppConfig):
    name = 'match'
    verbose_name = _('Mecze')
