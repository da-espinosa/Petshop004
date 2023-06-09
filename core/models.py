from django.db import models
from django.contrib.auth.models import User
import uuid
# Create your models here.


class TipoProducto(models.Model):
  nombreTipo  = models.CharField(max_length=30);

  def __str__(self):
    return self.nombreTipo
    

class Producto(models.Model):
  nombre      = models.CharField(max_length=30)
  descripcion = models.CharField(max_length=60)
  precio      = models.IntegerField()
  stock       = models.IntegerField()
  imagen      = models.ImageField(null=True,blank=True)
  tipo        = models.ForeignKey(TipoProducto, on_delete=models.CASCADE) 

  def __str__(self):
    return self.nombre



class Cliente(models.Model):
  nombre     = models.CharField(max_length=40)
  apellido = models.CharField(max_length=40)
  user = models.OneToOneField('authentication.User', on_delete = models.CASCADE, verbose_name = 'Usuario', null=True)

  def __str__(self):
    return self.nombre

class Comentario(models.Model):
  resena      = models.CharField(max_length=60)
  user        = models.ForeignKey(Cliente, on_delete=models.CASCADE) 

  def __str__(self):
    return self.resena


class Carrito(models.Model):
  cliente    = models.ForeignKey(Cliente, on_delete=models.CASCADE) 
  producto    = models.ForeignKey(Producto, on_delete=models.CASCADE) 
  cantidad    = models.IntegerField()
  vigente = models.BooleanField()

  def __str__(self):
    return self.cliente.user.username


class Suscripcion(models.Model):
    cliente     = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    correo      = models.CharField(max_length=60)
    fecha       = models.DateField()

    def __str__(self):
        return self.cliente.user.username


class Estado(models.Model):
  nombreEstado  = models.CharField(max_length=50);

  def __str__(self):
    return self.nombreEstado
  


class Compra(models.Model):
    codigo = models.CharField(max_length=20)
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    carrito = models.ForeignKey(Carrito, on_delete=models.CASCADE)
    direccion = models.CharField(max_length=50)
    contacto = models.CharField(max_length=50)
    fecha = models.DateField()
    nombreEstado = models.ForeignKey(Estado, on_delete=models.CASCADE)

    def __str__(self):
        return self.codigo