from django.db import models
from django.utils.translation import ugettext_lazy as _

from utils import models as utils_models
from django.template.defaultfilters import striptags

class Rules(utils_models.BaseModel):
    content = models.TextField(verbose_name=_('Treść'))

    class Meta(utils_models.PermMetaView):
        abstract = False
        verbose_name = _('Zasady')
        verbose_name_plural = _('Zasady')

    def __str__(self):
        content = str(_('[Treść zasad]'))
        if self.content:
            content = striptags(self.content)
        return (content[:20] + '..') if len(content) > 20 else content
