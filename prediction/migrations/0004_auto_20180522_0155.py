# Generated by Django 2.0.4 on 2018-05-21 23:55

from django.conf import settings
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('match', '0003_auto_20180501_2349'),
        ('prediction', '0003_prediction_editable'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='prediction',
            unique_together={('user', 'match')},
        ),
    ]
