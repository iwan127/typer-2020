# Generated by Django 2.0.4 on 2018-06-11 08:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('match', '0004_match_prediction_enabled'),
    ]

    operations = [
        migrations.AlterField(
            model_name='match',
            name='group',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='matches', to='round.Group', verbose_name='Grupa'),
        ),
    ]
