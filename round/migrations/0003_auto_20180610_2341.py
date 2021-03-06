# Generated by Django 2.0.4 on 2018-06-10 21:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('round', '0002_remove_round_matches'),
    ]

    operations = [
        migrations.AlterField(
            model_name='groupteam',
            name='goals_conceded',
            field=models.SmallIntegerField(default=0, verbose_name='Gole stracone'),
        ),
        migrations.AlterField(
            model_name='groupteam',
            name='goals_scored',
            field=models.SmallIntegerField(default=0, verbose_name='Gole strzelone'),
        ),
        migrations.AlterField(
            model_name='groupteam',
            name='matches',
            field=models.SmallIntegerField(default=0, verbose_name='Mecze'),
        ),
    ]
