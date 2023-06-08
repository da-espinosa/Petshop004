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
        fields = '__all__'  



class SubscripcionForm(ModelForm):
    correo        = forms.CharField(min_length=3,widget=forms.TextInput(attrs={"placeholder":"Ingrese correo"}))
    user        = forms.CharField(min_length=3,widget=forms.TextInput(attrs={"placeholder":"Ingrese nombre de usuario"}))

    class Meta:
        model = Subscripcion
        fields = '__all__'  