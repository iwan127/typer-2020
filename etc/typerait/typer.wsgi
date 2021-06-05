#!/usr/bin/env python

import os
import sys
VENV = '/home/wojtek/.virtualenvs/typerait/lib/python3.5/site-packages'

sys.path.insert(0, VENV)
import site
site.addsitedir(VENV)

path = ('/home/wojtek/typerait/www', '/home/wojtek/typerait/www/typer')
for i in path:
    if i not in sys.path:
        sys.path.append(i)

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "typer.settings")

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
