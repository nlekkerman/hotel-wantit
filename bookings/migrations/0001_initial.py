# Generated by Django 4.2.13 on 2024-06-27 14:19

import cloudinary.models
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Room',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('room_number', models.CharField(max_length=20, unique=True)),
                ('featured_image', cloudinary.models.CloudinaryField(default='placeholder', max_length=255, verbose_name='image')),
                ('room_type', models.CharField(choices=[('deluxe', 'Deluxe Room'), ('superior', 'Superior Room'), ('standard', 'Standard Room')], max_length=10)),
                ('description', models.TextField()),
                ('capacity', models.PositiveIntegerField(default=1)),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('available', models.BooleanField(default=True)),
            ],
        ),
        migrations.CreateModel(
            name='Reservation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('email', models.EmailField(max_length=254)),
                ('phone', models.CharField(max_length=15)),
                ('checkin_date', models.DateField()),
                ('checkout_date', models.DateField()),
                ('type_of_room', models.CharField(choices=[('deluxe', 'Deluxe Room'), ('superior', 'Superior Room'), ('standard', 'Standard Room')], max_length=10)),
                ('price', models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True)),
                ('reservation_status', models.CharField(choices=[('pending', 'Pending'), ('confirmed', 'Confirmed'), ('rejected', 'Rejected')], default='pending', max_length=20)),
                ('room', models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='bookings.room')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
