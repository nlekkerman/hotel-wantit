# Generated by Django 4.2.13 on 2024-06-30 14:18

import cloudinary.models
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('bookings', '0002_reservation_first_name_reservation_last_name'),
    ]

    operations = [
        migrations.CreateModel(
            name='MinibarImage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', cloudinary.models.CloudinaryField(max_length=255, verbose_name='image')),
                ('room', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='minibar_images', to='bookings.room')),
            ],
        ),
        migrations.CreateModel(
            name='BathroomImage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', cloudinary.models.CloudinaryField(max_length=255, verbose_name='image')),
                ('room', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='bathroom_images', to='bookings.room')),
            ],
        ),
    ]