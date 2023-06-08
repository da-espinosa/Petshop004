from django.shortcuts import render, redirect
from .models import *
from .forms import *
from django.contrib import messages
from rest_framework import viewsets
from .serializers import * 
import requests



# CREANDO UNA CLASE QUE VA A PERMITIR LA TRANSACCION

class ProductoViewset(viewsets.ModelViewSet):
      queryset = Producto.objects.all() 
     #queryset = Producto.objects.filter(tipo=1)
      serializer_class = ProductoSerializers


class TipoProductoViewset(viewsets.ModelViewSet):
      queryset = TipoProducto.objects.all()
      serializer_class = TipoProductoSerializers



#Productos

def index(request):
    productosAll = Producto.objects.all()
    data = {
        'listado': productosAll
    }
    return render(request, 'core/index.html', data)

def indexapi(request):
    respuesta = requests.get('http://127.0.0.1:8000/api/productos/')
    respuesta2 = requests.get('https://mindicador.cl/api')
    respuesta3 = requests.get('https://rickandmortyapi.com/api/character')
    
    
    #transformacion del json

    productos = respuesta.json()
    monedas = respuesta2.json()
    aux = respuesta3.json()
    personajes = aux['results']


    data = {
        'listado': productos,
        'moneda' : monedas,
        'personajes' : personajes,
    }
    return render(request, 'core/indexapi.html', data)

def about(request):
    return render(request,('core/about.html'))

def blog(request):
    return render(request,('core/blog.html'))

def carrito(request):
    cliente = Cliente.objects.filter(user=request.user.username)[:1]
    CarritoCliente = Carrito.objects.filter(cliente=cliente)
    data = {
        'listado' : CarritoCliente
    }
    respuesta = requests.get('https://mindicador.cl/api/dolar')
    monedas = respuesta.json()
    valor_usd = monedas['serie'] [0] ['valor']

    valor_carrito = 20000 #for para hacer la sumatoria de los productos

    valor_total = valor_carrito/valor_usd

    data = {
        'valor': round(valor_total, 2)
    }
    return render(request, 'core/carrito.html', data)

def checkout(request):
    return render(request,('core/checkout.html'))

def detalle(request):
    return render(request,('core/detalle.html'))

def sesion(request):
    return render(request,('core/sesion.html'))

def subscripcion(request):
    data = {
        'form' : SubscripcionForm()
    }

    if request.method == 'POST':
        formulario = SubscripcionForm(request.POST, files=request.FILES) 
        if formulario.is_valid():
            formulario.save() 
            data['msj'] = "Subscripcion guardada correctamente"
            messages.success(request, "Subscripcion almacenada correctamente")
    return render(request,'core/subscripcion.html', data)

def oneProduct(request):
    data = {
        'form' : CantidadForm()
    }

    if request.method == 'POST':
        formulario = CantidadForm(request.POST, files=request.FILES) 
        if formulario.is_valid():
            formulario.save() 
            data['msj'] = "Producto guardado correctamente"
            messages.success(request, "Producto almacenado correctamente")


    return render(request, 'core/oneProduct.html', data)
 


def price(request):
    return render(request,('core/price.html'))

def product(request, id):
    producto = Producto.objects.get(id=id)
    cliente = Cliente.objects.get(user=request.user.username)
    productosAll = Producto.objects.all()

    data = {
        'producto' : producto,
        'user' : request.user.username,
        'form' : CantidadForm(initial={'cantidad': 1})
    }

    if request.method == 'POST':
        formulario = CantidadForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            carrito = Carrito.objects.create(cliente=Cliente,producto=producto,cantidad=formulario.data["cantidad"])


    data = {
        'listado': productosAll
    }
    return render(request, 'core/product.html', data)

def prue(request):
    carritosAll = Producto.objects.all()
    data = {
        'listado': carritosAll
    }
    return render(request,'core/prue.html', data)

def seguimiento(request):
    productosAll = Producto.objects.all()[:1]
    data = {
        'listado': productosAll
    }
    return render(request,'core/seguimiento.html', data)

def registrar(request):
    data = {
        'form' : ClienteForm()
    }

    if request.method == 'POST':
        formulario = ClienteForm(request.POST, files=request.FILES) 
        if formulario.is_valid():
            formulario.save() 
            data['msj'] = "Cliente guardado correctamente"
            messages.success(request, "Cliente almacenado correctamente")

    return render(request,'core/registrar.html', data)

def service(request):
    return render(request,('core/service.html'))

def team(request):
    return render(request,('core/team.html'))
    
def testimonio(request):
    return render(request,('core/testimonio.html'))

#CRUD
def add(request):
    data = {
        'form' : ProductoForm()
    }

    if request.method == 'POST':
        formulario = ProductoForm(request.POST, files=request.FILES) 
        if formulario.is_valid():
            formulario.save() 
            data['msj'] = "Producto guardado correctamente"
            messages.success(request, "Producto almacenado correctamente")

    return render(request, 'core/addProduct.html', data)


def update(request,id):
    producto = Producto.objects.get(id=id)
    data = {
        'form' : ProductoForm(instance=producto) 
    }

    if request.method == 'POST':
        formulario = ProductoForm(data=request.POST, instance=producto, files=request.FILES)
        if formulario.is_valid():
            formulario.save()
            #data['msj'] = "Producto modificado correctamente"
            messages.success(request, "Producto modificado correctamente")
            data['form'] = formulario 

    return render(request, 'core/updateProduct.html', data)

def delete(request,id):
    producto = Producto.objects.get(id=id) 
    producto.delete()

    return redirect(to="index")

