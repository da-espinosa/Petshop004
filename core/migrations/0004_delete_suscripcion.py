# Generated by Django 3.1.2 on 2023-06-21 18:40

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_remove_suscripcion_porcentaje'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Suscripcion',
        ),
    ]