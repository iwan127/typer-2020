from django.db import models
from django.utils.translation import ugettext_lazy as _

from utils import models as utils_models

class Stadium(utils_models.BaseModel):
    name = models.CharField(verbose_name=_('Nazwa'), max_length=512)
    city = models.CharField(verbose_name=_('Miasto'), max_length=512)
    country = models.CharField(verbose_name=_('Kraj'), max_length=512, null=True)

    def __str__(self):
        return self.name

    class Meta(utils_models.PermMeta):
        abstract = False
        verbose_name = _('Stadion')
        verbose_name_plural = _('Stadiony')
