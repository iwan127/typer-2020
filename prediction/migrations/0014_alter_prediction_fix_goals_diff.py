# Generated by Django 3.2.4 on 2021-06-04 22:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('prediction', '0013_auto_20180807_1830'),
    ]

    operations = [
        migrations.AlterField(
            model_name='prediction',
            name='fix_goals_diff',
            field=models.BooleanField(blank=True, default=False, verbose_name='Czy typ był poprawiony: błąd z różnicą bramek'),
        ),
    ]
