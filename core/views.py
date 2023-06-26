from django.shortcuts import render, redirect 
from .models import *
from .forms import *
from django.contrib import messages
from rest_framework import viewsets
from .serializers import * 
import requests
from authentication.models import User
from django.contrib.auth.decorators import login_required, user_passes_test


def grupo_requerido(nombre_grupo):
    def decorator(view_fuc):
        @user_passes_test(lambda user: user.groups.filter(name=nombre_grupo).exists())
        def wrapper(request, *arg, **kwargs):
            return view_fuc(request, *arg, **kwargs)
        return wrapper
    return decorator

# @grupo_requerido('vendedor')


#grupo = Group.objects.get(name='cliente')
#user.groups.add(grupo)

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

#@grupo_requerido('admministradores')
def indexapi(request):
    respuesta = requests.get('http://127.0.0.1:8000/api/productos/')
    respuesta2 = requests.get('https://mindicador.cl/api')
    respuesta3 = requests.get('https://rickandmortyapi.com/api/character')
    #respuesta4 = request.get('http://127.0.0.1:8000/api/tipoproductos/')
    
    
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

@grupo_requerido('cliente')
def carrito(request):
    user = User.objects.filter(username=request.user.username).first()
    cliente = Cliente.objects.filter(user=user).first()
    CarritoCliente = Carrito.objects.filter(cliente=cliente)
    data = {
        'listado' : CarritoCliente
    }

    respuesta = requests.get('https://mindicador.cl/api/dolar')
    monedas = respuesta.json()
    valor_usd = monedas['serie'] [0] ['valor']

    valor_carrito = sum(carrito.producto.precio*carrito.cantidad for carrito in CarritoCliente)

    try:
        suscripcionCliente = Suscripcion.objects.get(cliente=cliente)
    except Suscripcion.DoesNotExist:
        suscripcionCliente = None
    if suscripcionCliente != None:
        descuento = round(valor_carrito*0.05)
    else:
        descuento = 0

    valor_carritousd = valor_carrito/valor_usd
    total_descuentousd = descuento/valor_usd
    valor_total = valor_carrito-descuento
    valor_total = valor_total/valor_usd
    data['valor'] = round(valor_total, 2)
    data['descuento'] = round(total_descuentousd, 2)
    data['total_carrito'] = round(valor_carritousd, 2)

    return render(request, 'core/carrito.html', data)

def checkout(request):
    return render(request,('core/checkout.html'))

def detalle(request):
    return render(request,('core/detalle.html'))

def sesion(request):
    return render(request,('core/sesion.html'))

@grupo_requerido('cliente')
def suscripcion(request):
    user = User.objects.filter(username=request.user.username).first()
    cliente = Cliente.objects.get(user=user)

    data = {
        'form' : SuscripcionForm()
    }

    if request.method == 'POST':
        formulario = SuscripcionForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            suscripcion = Suscripcion.objects.create(cliente=cliente,correo=formulario.data["correo"])

    return render(request, 'core/suscripcion.html', data)

@grupo_requerido('cliente')
def oneProduct(request,id):
    producto = Producto.objects.get(id=id)
    user = User.objects.filter(username=request.user.username).first()
    cliente = Cliente.objects.get(user=user)

    data = {
        'producto' : producto,
        'user' : request.user.username,
        'form' : CantidadForm(initial={'cantidad': 1})
    }

    if request.method == 'POST':
        formulario = CantidadForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            carrito = Carrito.objects.create(cliente=cliente,producto=producto,cantidad=formulario.data["cantidad"])

    if request.method == 'POST':
        formulario = CantidadForm(request.POST, files=request.FILES) # OBTIENE LA DATA DEL FORMULARIO
        if formulario.is_valid():
            try:
                CarritoCP = Carrito.objects.get(cliente=cliente,producto=producto)
                cantidadstock = CarritoCP.cantidad+producto.stock
                CarritoCP.cantidad = CarritoCP.cantidad + int(formulario.data["cantidad"])
                if CarritoCP.cantidad > cantidadstock:
                    CarritoCP.cantidad = cantidadstock
                    CarritoCP.save()
                    producto.stock = 0
                elif CarritoCP.save():
                    CarritoCP.delete()
                    producto.stock = producto.stock + CarritoCP.cantidad
                else:
                    CarritoCP.save()
                    producto.stock = producto.stock-int(formulario.data["cantidad"])
            except Carrito.DoesNotExist:
                if int(formulario.data["cantidad"]) > producto.stock:
                    carrito = Carrito.objects.create(cliente=cliente,producto=producto,cantidad=producto.stock)
                    producto.stock = 0
                else:
                    carrito = Carrito.objects.create(cliente=cliente,producto=producto,cantidad=int(formulario.data["cantidad"]))
                    producto.stock = producto.stock-int(formulario.data["cantidad"])
    producto.save()
    
    return render(request, 'core/oneProduct.html', data)
    
 


def price(request):
    return render(request,('core/price.html'))

def product(request):
    productosAll = Producto.objects.all()

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

#@grupo_requerido('administradores')
#@grupo_requerido('cliente')
def seguimiento(request):
    productosAll = Producto.objects.all()[:1]
    seguimientoAll = Seguimiento.objects.all()[:1]
    data = {
        'listado': productosAll,
        'listado2': seguimientoAll
    }

    return render(request,'core/seguimiento.html', data)


def registrar(request):
    data = {
        'form' : ClienteForm()
    }

    if request.method == 'POST':
        formulario = ClienteForm(request.POST, files=request.FILES) 
        if formulario.is_valid():
            nombre = formulario.cleaned_data['nombre']
            apellido = formulario.cleaned_data['apellido']
            usuario = formulario.cleaned_data['user']
            contrasena = formulario.cleaned_data['contrasena']
            # Creamos un usuario de tipo cliente
            user = User()
            user.username = usuario
            user.set_password(contrasena)
            user.save()
            cliente = Cliente.objects.create(nombre=nombre, apellido=apellido, user=user)
            cliente.save()
            data['msj'] = "Cliente guardado correctamente"
            messages.success(request, "Cliente almacenado correctamente")
        return render(request,'core/index.html')

    return render(request,'core/registrar.html', data)

def service(request):
    return render(request,('core/service.html'))

def team(request):
    return render(request,('core/team.html'))
    
def testimonio(request):
    return render(request,('core/testimonio.html'))

#CRUD
@grupo_requerido('vendedor')
def add(request):
    data = {
        'form' : ProductoForm()
    }

    if request.method == 'POST':
        formulario = ProductoForm(request.POST, files=request.FILES) 
        if formulario.is_valid():
            formulario.save() 
            #data['msj'] = "Producto guardado correctamente"
            messages.success(request, "Producto almacenado correctamente")

    return render(request, 'core/addProduct.html', data)

@grupo_requerido('vendedor')
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

@grupo_requerido('vendedor')
def delete(request,id):
    producto = Producto.objects.get(id=id) 
    producto.delete()

    return redirect(to="index")

def deleteCarrito(request,id):
    itemCarrito = Carrito.objects.get(id=id)
    User = itemCarrito.cliente
    itemCarrito.delete()

    return redirect(to="carrito")

@grupo_requerido('vendedor')
def deleteProducto(request,id):
    itemProducto = Producto.objects.get(id=id)
    itemProducto.delete()

    return redirect(to="index")


def deleteSuscripcion(request, id):
    cliente = User.objects.get(username=request.user.username)
    suscripcionCliente = Suscripcion.objects.get(cliente=cliente) 
    suscripcionCliente.delete()

    return redirect(to="index")

def addSeguimiento(request):
    data = {
        'form' : SeguimientoForm()
    }

    if request.method == 'POST':
        formulario = SeguimientoForm(request.POST, files=request.FILES) 
        if formulario.is_valid():
            formulario.save() 
            #data['msj'] = "Producto guardado correctamente"
            messages.success(request, "Seguimiento almacenado correctamente")

    return render(request, 'core/addSeguimiento.html', data)


def updateSeguimiento(request, id):
    seguimiento = Seguimiento.objects.get(id=id)
    data = {
        'form' : SeguimientoForm(instance=seguimiento) 
    }

    if request.method == 'POST':
        formulario = SeguimientoForm(data=request.POST, instance=seguimiento, files=request.FILES)
        if formulario.is_valid():
            formulario.save()
            messages.success(request, "Seguimiento modificado correctamente")
            data['form'] = formulario 

    return render(request, 'core/updateSeguimiento.html', data)