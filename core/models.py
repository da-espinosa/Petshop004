from django.db import models


#fecha = models.DateField

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
  user       = models.CharField(max_length=30)
  contrasena = models.CharField(max_length=20)
  nombre     = models.CharField(max_length=40)
  apellido = models.CharField(max_length=40)


  def __str__(self):
    return self.user

class Comentario(models.Model):
  resena      = models.CharField(max_length=60)
  user        = models.ForeignKey(Cliente, on_delete=models.CASCADE) 

  def __str__(self):
    return self.resena


class Carrito(models.Model):
  cliente    = models.ForeignKey(Cliente, on_delete=models.CASCADE) 
  producto    = models.ForeignKey(Producto, on_delete=models.CASCADE) 

  def __str__(self):
    return self.cliente.user


class Subscripcion(models.Model):
  correo         = models.CharField(max_length=60)
  cliente        = models.ForeignKey(Cliente, on_delete=models.CASCADE) 

  def __str__(self):
    return self.cliente.user