from django import forms
from django.forms import ModelForm
from .models import *

class ProductoForm(ModelForm):

    nombre      = forms.CharField(min_length=4,widget=forms.TextInput(attrs={"placeholder":"Ingrese Nombre"}))
    descripcion = forms.CharField(min_length=10,max_length=200,widget=forms.Textarea(attrs={"rows":4}))
    precio      = forms.IntegerField(min_value=0,widget=forms.NumberInput(attrs={"placeholder":"Ingrese Precio"}))
    stock       = forms.IntegerField(min_value=0,widget=forms.NumberInput(attrs={"placeholder":"Ingrese Stock"}))

    class Meta:
        model = Producto
        fields = '__all__'


class ClienteForm(ModelForm):

    user        = forms.CharField(min_length=3,widget=forms.TextInput(attrs={"placeholder":"Ingrese nombre de usuario"}))
    contrasena  = forms.CharField(min_length=5,widget=forms.TextInput(attrs={"placeholder":"Ingrese una contraseña"}))
    nombre      = forms.CharField(min_length=3,widget=forms.TextInput(attrs={"placeholder":"Ingrese nombre"}))
    apellido    = forms.CharField(min_length=3,widget=forms.TextInput(attrs={"placeholder":"Ingrese apellido"}))


    class Meta:
        model = Cliente
        exclude = ('contrasena','user')  



class CantidadForm (ModelForm):
    cantidad = forms.IntegerField(min_value=1, max_value=5, widget=forms.NumberInput(attrs={"placeholder":"Ingrese Cantidad"}))

    class Meta:
        model = Carrito
        fields = ['cantidad']


class CarritoForm (ModelForm):
    cliente = forms.CharField()
    producto = forms.IntegerField
    cantidad = forms.IntegerField(min_value=1, max_value=5, widget=forms.NumberInput(attrs={"placeholder":"Ingrese Cantidad"}))

    class Meta:
        model = Carrito
        fields = ['cantidad']


class SuscripcionForm (ModelForm):
    correo = forms.CharField(min_length=3,widget=forms.TextInput(attrs={"placeholder":"Ingrese su correo"}))

    class Meta:
        model = Suscripcion
        fields = ['correo']

class EstadoForm(ModelForm):
    class Meta:
        model = Compra
        fields = ['nombreEstado']



class envioForm (ModelForm):
    direccion = forms.CharField(min_length=3,widget=forms.TextInput(attrs={"placeholder":"Ingrese Dirección"}))
    contacto = forms.CharField(min_length=3,widget=forms.TextInput(attrs={"placeholder":"Ingrese Contacto"}))

    class Meta:
        model = Compra
        fields = ['direccion','contacto']