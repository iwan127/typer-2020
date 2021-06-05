from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.core.files.storage import FileSystemStorage

from utils import models as utils_models
import os
from django.conf import settings


def upload_file_name(team, filename):
    
    return 'teams/%s.%s' % (team.shortname.lower(), filename[-3:])


class OverwriteFileSystemStorage(FileSystemStorage):
    def get_available_name(self, name, max_length=None):
        if self.exists(name):
            os.remove(self.path(name))
        return name


fs = OverwriteFileSystemStorage(location=settings.MEDIA_PATH + 'teams/')


class Team(utils_models.BaseModel):
    name = models.CharField(verbose_name=_('Nazwa'), max_length=512)
    shortname = models.CharField(verbose_name=_('Nazwa skrócona'), max_length=3)
    logo = models.ImageField(verbose_name=_('Herb / flaga'), upload_to=upload_file_name, blank=True)
    vertical_logo = models.BooleanField(verbose_name=_('Czy logo pionowe'), default=False)

    def __str__(self):
        return self.name

    class Meta(utils_models.PermMeta):
        abstract = False
        verbose_name = _('Drużyna')
        verbose_name_plural = _('Drużyny')
