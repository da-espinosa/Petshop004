# Generated by Django 3.1.2 on 2023-07-07 05:38

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0017_auto_20230707_0106'),
    ]

    operations = [
        migrations.CreateModel(
            name='Carrito',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cantidad', models.IntegerField()),
                ('cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.cliente')),
                ('producto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.producto')),
            ],
        ),
        migrations.RemoveField(
            model_name='suscripcion',
            name='cliente',
        ),
        migrations.DeleteModel(
            name='Compra',
        ),
        migrations.DeleteModel(
            name='Suscripcion',
        ),
    ]