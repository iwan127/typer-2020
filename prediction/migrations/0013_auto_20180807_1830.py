# Generated by Django 2.0.4 on 2018-08-07 16:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('prediction', '0012_auto_20180618_0053'),
    ]

    operations = [
        migrations.AddField(
            model_name='prediction',
            name='fix_goals_diff',
            field=models.BooleanField(default=False, verbose_name='Czy typ był poprawiony: błąd z różnicą bramek'),
        ),
        migrations.AlterField(
            model_name='extraquestions',
            name='answer_type',
            field=models.SmallIntegerField(choices=[(1, 'Tekstowa'), (2, 'Jedna drużyna'), (3, 'Dwie drużyny'), (4, 'Dwie drużyny w grupie'), (5, 'Runda')], verbose_name='Rodzaj odpowiedzi'),
        ),
    ]
