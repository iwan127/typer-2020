# Generated by Django 2.0.4 on 2018-06-17 22:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('prediction', '0010_auto_20180617_2223'),
    ]

    operations = [
        migrations.AlterField(
            model_name='extraquestions',
            name='answer_type',
            field=models.SmallIntegerField(choices=[(1, 'Tekstowa'), (2, 'Jedna drużyna'), (3, 'Dwie drużyny'), (3, 'Dwie drużyny w grupie'), (5, 'Runda')], verbose_name='Rodzaj odpowiedzi'),
        ),
        migrations.AlterField(
            model_name='extraquestionsuseranswers',
            name='answer_integer',
            field=models.TextField(verbose_name='Odpowiedź numeryczna'),
        ),
    ]
