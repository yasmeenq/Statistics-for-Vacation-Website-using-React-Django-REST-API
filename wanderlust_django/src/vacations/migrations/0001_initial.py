# Generated by Django 5.1.2 on 2024-10-27 13:09

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='CountriesModel',
            fields=[
                ('countryID', models.AutoField(primary_key=True, serialize=False)),
                ('countryName', models.CharField(blank=True, max_length=50, null=True)),
            ],
            options={
                'db_table': 'countries',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='VacationsModel',
            fields=[
                ('vacationID', models.AutoField(primary_key=True, serialize=False)),
                ('description', models.TextField()),
                ('startDate', models.DateField(blank=True, null=True)),
                ('endDate', models.DateField(blank=True, null=True)),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('vacationImage', models.ImageField(blank=True, null=True, upload_to='vacationImage/')),
                ('countryName', models.ForeignKey(db_column='countryID', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='vacations', to='vacations.countriesmodel')),
            ],
            options={
                'db_table': 'vacations',
            },
        ),
        migrations.CreateModel(
            name='LikesModel',
            fields=[
                ('likesID', models.AutoField(primary_key=True, serialize=False)),
                ('userID', models.ForeignKey(db_column='userID', on_delete=django.db.models.deletion.CASCADE, related_name='likes', to=settings.AUTH_USER_MODEL)),
                ('vacationID', models.ForeignKey(db_column='vacationID', on_delete=django.db.models.deletion.CASCADE, related_name='likes', to='vacations.vacationsmodel')),
            ],
            options={
                'db_table': 'likes',
                'managed': True,
            },
        ),
    ]
