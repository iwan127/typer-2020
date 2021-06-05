import os
from os.path import dirname

ALLOWED_HOSTS = ['typertest.aitsolutions.pl', ]

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'typertest',
        'USER': 'wojtek',
        'PASSWORD': 'Eish7Ienaisa',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}

# EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

MEDIA_ROOT = '/home/wojtek/typertest/media/'
STATIC_ROOT = '/home/wojtek/typertest/static/'
MEDIA_URL = 'https://typertest.aitsolutions.pl/media/'
STATIC_URL = 'https://typertest.aitsolutions.pl/static/'

# MEDIA_URL = '/media/'
ROOT_PATH = dirname(dirname(os.path.realpath(__file__)))
STATIC_PATH = STATIC_ROOT
MEDIA_PATH = MEDIA_ROOT

TINYMCE_JS_URL = STATIC_URL + 'plugins/tinymce/tinymce.min.js'
TINYMCE_JS_ROOT = STATIC_PATH + 'plugins/tinymce'
TINYMCE_DEFAULT_CONFIG = {'theme': 'modern', 'relative_urls': True}

# MEDIA_ROOT = 'D:/_projekty/bemygo/static/media/'
