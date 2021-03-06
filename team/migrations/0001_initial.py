# Generated by Django 2.0.4 on 2018-05-01 14:18

from django.db import migrations, models
import team.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Team',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=512, verbose_name='Nazwa')),
                ('shortname', models.CharField(max_length=3, verbose_name='Nazwa skrócona')),
                ('logo', models.ImageField(blank=True, storage=team.models.OverwriteFileSystemStorage(location='../static/img/teams/'), upload_to=team.models.upload_file_name, verbose_name='Herb / flaga')),
            ],
            options={
                'verbose_name': 'Drużyna',
                'verbose_name_plural': 'Drużyny',
                'abstract': False,
                'default_permissions': ('add', 'change', 'delete', 'view'),
            },
        ),
    ]
