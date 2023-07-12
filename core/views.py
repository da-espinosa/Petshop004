from django.shortcuts import render, redirect 
from .models import *
from .forms import *
from django.contrib import messages
import datetime
from datetime import date   
from datetime import timedelta
from rest_framework import viewsets
from .serializers import * 
import requests
import uuid
from django.contrib.auth.models import User,Group
from django.shortcuts import get_object_or_404
from authentication.models import User
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth import authenticate, login


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

class EstadoViewset(viewsets.ModelViewSet):
      queryset = Estado.objects.all()
      serializer_class = EstadoSerializers

class CompraViewset(viewsets.ModelViewSet):
      queryset = Compra.objects.all()
      serializer_class = CompraSerializers


#Productos

def index(request):
    productosAll = Producto.objects.all()[:4]
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
    CarritoCliente = Carrito.objects.filter(cliente=cliente, vigente = True)
    data = {
        'listado' : CarritoCliente,
        'form': envioForm()
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

def historial(request):
    user = User.objects.filter(username=request.user.username).first()
    cliente = Cliente.objects.filter(user=user).first()
    compra = []

    if cliente is not None:
        compra = Compra.objects.filter(cliente=cliente)

    data = {
        'listado': compra
    }
    
    return render(request,'core/historial.html', data)

def sesion(request):
    return render(request,('core/sesion.html'))



@grupo_requerido('cliente')
def suscripcion(request):
    user = request.user
    cliente = Cliente.objects.get(user=user)

    respuesta = requests.get('https://mindicador.cl/api/dolar')
    monedas = respuesta.json()
    valor_usd = monedas['serie'][0]['valor']

    data = {'form': None}

    if request.method == 'POST':
        formulario = SuscripcionForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            suscripcion = formulario.save(commit=False)
            suscripcion.cliente = cliente
            monto_ingresado = formulario.cleaned_data['monto']
            suscripcion.monto = monto_ingresado
            suscripcion.save()
            valor_total = monto_ingresado / valor_usd
            data['form'] = formulario
            data['valor'] = round(valor_total, 2)

    else:
        formulario = SuscripcionForm(initial={'monto': 1000})
        data['form'] = formulario

    return render(request, 'core/suscripcion.html', data)

@grupo_requerido('cliente')
def suscripcion(request):
    user = request.user
    cliente = Cliente.objects.get(user=user)

    data = {'form': None}

    if request.method == 'POST':
        formulario = SuscripcionForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            suscripcion = formulario.save(commit=False)
            suscripcion.cliente = cliente
            suscripcion.fecha = date.today() + timedelta(days=30)  # Fecha por defecto: fecha actual + 30 días
            suscripcion.save()
            data['form'] = formulario
            #data['mensaje'] = 'Gracias por suscribirte.'

    else:
        formulario = SuscripcionForm()
        data['form'] = formulario

    return render(request, 'core/suscripcion.html', data)







@grupo_requerido('cliente')
def oneProduct(request, id):
    producto = Producto.objects.get(id=id)
    user = User.objects.filter(username=request.user.username).first()
    cliente = Cliente.objects.get(user=user)

    data = {
        'producto': producto,
        'user': request.user.username,
        'form': CantidadForm(initial={'cantidad': 1})
    }

    if request.method == 'POST':
        formulario = CantidadForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            try:
                carritoCP = Carrito.objects.get(cliente=cliente, producto=producto, vigente=True)
                cantidad_stock = carritoCP.cantidad + producto.stock
                cantidad_agregada = int(formulario.cleaned_data["cantidad"])

                if cantidad_agregada > cantidad_stock:
                    cantidad_agregada = cantidad_stock

                carritoCP.cantidad = carritoCP.cantidad + cantidad_agregada
                carritoCP.save()
                producto.stock = producto.stock - cantidad_agregada
            except Carrito.DoesNotExist:
                cantidad_agregada = int(formulario.cleaned_data["cantidad"])
                if cantidad_agregada > producto.stock:
                    cantidad_agregada = producto.stock

                carrito = Carrito.objects.create(cliente=cliente, producto=producto, cantidad=cantidad_agregada, vigente=True)
                producto.stock = producto.stock - cantidad_agregada

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


def seguimientoAdmin(request):
    compras = Compra.objects.all()

    data = {
        'listado': compras
    }

    return render(request, 'core/seguimientoAdmin.html', data)





def seguimiento(request):
    user = User.objects.filter(username=request.user.username).first()
    cliente = Cliente.objects.filter(user=user).first()
    compra = []

    if cliente is not None:
        compra = Compra.objects.filter(cliente=cliente)

    data = {
        'listado': compra
    }

    return render(request, 'core/seguimiento.html', data)




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
            grupo = Group.objects.get(name='cliente')
            user.groups.add(grupo)
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
    producto = Producto.objects.get(nombre=itemCarrito.producto.nombre)
    producto.stock = producto.stock+itemCarrito.cantidad
    producto.save()
    itemCarrito.delete()

    return redirect(to="carrito")

@grupo_requerido('vendedor')
def deleteProducto(request,id):
    itemProducto = Producto.objects.get(id=id)
    itemProducto.delete()

    return redirect(to="index")

def adminSuscripcion(request):
    suscripciones = Suscripcion.objects.all()
    data={
        'listado' : suscripciones
    }
    return render(request,'core/adminSuscripcion.html',data)


def deleteSuscripcion(request, id):
    suscripcion = Suscripcion.objects.get(id=id)
    suscripcion.delete()
    return redirect('index')  


def addSeguimiento(request):
    data = {
        #'form' : SeguimientoForm()
    }

    if request.method == 'POST':
        #formulario = SeguimientoForm(request.POST, files=request.FILES) 
        #if formulario.is_valid():
            #formulario.save() 
            #data['msj'] = "Producto guardado correctamente"
            messages.success(request, "Seguimiento almacenado correctamente")

    return render(request, 'core/addSeguimiento.html', data)


def updateEstado(request, id):
    #comprasAll = Compra.objects.all().order_by('-id')
    compra = Compra.objects.get(id=id)
    data = {
        #'listado': comprasAll,
        'form' : EstadoForm(instance=compra) 
    }

    if request.method == 'POST':
        formulario = EstadoForm(data=request.POST, instance=compra, files=request.FILES)
        if formulario.is_valid():
            formulario.save()
            messages.success(request, "Seguimiento modificado correctamente")
            data['form'] = formulario 

    return render(request, 'core/updateSeguimiento.html', data)

def generar_id_random():
    id_random = str(uuid.uuid4())[:5]
    while Compra.objects.filter(codigo=id_random).exists():
        id_random = str(uuid.uuid4())[:5]
    return id_random



from django.shortcuts import get_object_or_404

@grupo_requerido('cliente')
def agregarCompra(request):
    user = User.objects.filter(username=request.user.username).first()
    cliente = Cliente.objects.filter(user=user).first()
    
    carritoCliente = Carrito.objects.filter(cliente=cliente, vigente=True)
    subtotal = sum(carrito.cantidad * carrito.producto.precio for carrito in carritoCliente)

    try:
        suscripcionCliente = Suscripcion.objects.get(cliente=cliente)
    except Suscripcion.DoesNotExist:
        suscripcionCliente = None

    if suscripcionCliente:
        descuento = round(subtotal * 0.05)
    else:
        descuento = 0

    total = subtotal - descuento

    if request.method == 'POST':
        formulario = envioForm(request.POST)
        if formulario.is_valid():
            codigo = generar_id_random()

            for carrito in carritoCliente:
                estado = Estado.objects.create(nombreEstado='validación')
                compra = Compra.objects.create(codigo=codigo, cliente=cliente, carrito=carrito, direccion=formulario.cleaned_data["direccion"], contacto=formulario.cleaned_data["contacto"], fecha=datetime.datetime.now(), nombreEstado=estado)
                
                carrito.vigente = False  
                carrito.save()  
                
                producto = carrito.producto
                producto.stock -= carrito.cantidad
                producto.save()

            return redirect('index')

    return render(request, 'core/agregarCompra.html', {
        'carritoCliente': carritoCliente,
        'subtotal': subtotal,
        'descuento': descuento,
        'total': total,
        'formulario': envioForm()
    })



def compra(request,id):
    compra = Compra.objects.get(id=id)
    totalxproducto = compra.carrito.producto.precio*compra.carrito.cantidad
    data = {
        'compra': compra,
        'total': totalxproducto
    }

    return render(request, 'core/compra.html', data)



