from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.models import AbstractUser
from django.core.files.storage import FileSystemStorage
try:
    from base64 import encodebytes
except ImportError:
    from base64 import encodestring as encodebytes

from utils import models as utils_models
import os
from django.conf import settings


def upload_file_name(user, filename):
    name = '%s-avatar.%s' % (user.id, filename[-3:])
    nameBytes = str.encode(name)
    nameBytesEncoded = encodebytes(nameBytes)
    nameEncoded = nameBytesEncoded.decode()
    return nameEncoded


class OverwriteFileSystemStorage(FileSystemStorage):
    def get_available_name(self, name, max_length=None):
        if self.exists(name):
            os.remove(self.path(name))
        return name


fs = OverwriteFileSystemStorage(location=settings.MEDIA_PATH)


class SystemUser(AbstractUser, utils_models.BaseModel):
    avatar = models.ImageField(verbose_name=_('Zdjęcie'), upload_to=upload_file_name, storage=fs, blank=True, null=True)
    nickname = models.CharField(verbose_name=_('Nazwa użytkownika'), max_length=128, blank=False, null=False)

    class Meta(utils_models.PermMeta):
        abstract = False
        verbose_name = _('Użytkownik systemu')
        verbose_name_plural = _('Użytkownicy systemu')
    
    def save(self, *args, **kwargs):
        if not self.nickname:
            self.nickname = self.username
        super(SystemUser, self).save(*args, **kwargs)
    
    def get_full_name(self):
        return self.nickname if self.nickname is not None else self.username
