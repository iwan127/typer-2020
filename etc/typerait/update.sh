#!/bin/sh

AHOME=/home/wojtek/typerait/www

CW=`pwd`
cd $AHOME/typer/
git pull
python manage.py migrate
python manage.py collectstatic --noinput
touch $AHOME/typer/typer.wsgi
cd $CW
# sudo /etc/init.d/supervisor restart
