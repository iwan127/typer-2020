# Generated by Django 2.0.4 on 2018-06-16 19:58

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('prediction', '0007_auto_20180607_1631'),
    ]

    operations = [
        migrations.CreateModel(
            name='ExtraQuestions',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('text', models.TextField(verbose_name='Treść pytania')),
                ('answer_type', models.SmallIntegerField(choices=[(1, 'Dokładny wynik'), (2, 'Rezultat'), (3, 'Różnica bramek'), (4, 'Bramki drużyny')], verbose_name='Rodzaj odpowiedzi')),
                ('points', models.SmallIntegerField(verbose_name='Liczba punktów do zdobycia')),
                ('correct_answer', models.SmallIntegerField(blank=True, null=True, verbose_name='Poprawna odpowiedź')),
                ('answer_enabled', models.BooleanField(default=True, verbose_name='Można udzielać odpowiedzi?')),
            ],
            options={
                'verbose_name': 'Pytanie dodatkowe',
                'verbose_name_plural': 'Pytania dodatkowe',
                'abstract': False,
                'default_permissions': ('add', 'change', 'delete', 'view'),
            },
        ),
        migrations.CreateModel(
            name='ExtraQuestionsUserAnswers',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('answer_text', models.TextField(verbose_name='Odpowiedź tekstowa')),
                ('answer_integer', models.SmallIntegerField(verbose_name='Odpowiedź numeryczna')),
                ('editable', models.BooleanField(default=True, verbose_name='Można edytować?')),
                ('question', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user_answers', to='prediction.ExtraQuestions', verbose_name='Pytanie')),
            ],
            options={
                'verbose_name': 'Odpowiedź użytkowników',
                'verbose_name_plural': 'Odpowiedzi użytkowników',
                'abstract': False,
                'default_permissions': ('add', 'change', 'delete', 'view'),
            },
        ),
        migrations.AddField(
            model_name='userpoints',
            name='n_extra_quiestions',
            field=models.SmallIntegerField(default=0, verbose_name='Punkty za pytania dodatkowe'),
        ),
        migrations.AddField(
            model_name='userpoints',
            name='n_yellow_cards',
            field=models.SmallIntegerField(default=0, verbose_name='Liczba żółtych kartek'),
        ),
    ]
