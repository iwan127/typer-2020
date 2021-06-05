import os
from os.path import dirname

ALLOWED_HOSTS = ['typer.aitsolutions.pl', ]

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'typer',
        'USER': 'wojtek',
        'PASSWORD': 'Eish7Ienaisa',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}

# EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

MEDIA_ROOT = '/home/wojtek/typer/media/'
STATIC_ROOT = '/home/wojtek/typer/static/'
MEDIA_URL = 'https://typer.aitsolutions.pl/media/'
STATIC_URL = 'https://typer.aitsolutions.pl/static/'

# MEDIA_URL = '/media/'
ROOT_PATH = dirname(dirname(os.path.realpath(__file__)))
STATIC_PATH = STATIC_ROOT
MEDIA_PATH = MEDIA_ROOT

TINYMCE_JS_URL = STATIC_URL + 'plugins/tinymce/tinymce.min.js'
TINYMCE_JS_ROOT = STATIC_PATH + 'plugins/tinymce'
TINYMCE_DEFAULT_CONFIG = {'theme': 'modern', 'relative_urls': True}

# MEDIA_ROOT = 'D:/_projekty/bemygo/static/media/'


LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'standard': {
            'format': "[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s",
            'datefmt': "%d/%b/%Y %H:%M:%S"
        },
    },
    'handlers': {
        'file': {
            'level': 'WARNING',
            'class': 'logging.FileHandler',
            'filename': '/var/log/typer/error.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file', ],
            'propagate': True,
            'level': 'WARNING',
        }
    }
}

