#SE ENCARGA DE CONVERTIR LOS DATOS
from .models import *
from rest_framework import serializers



class TipoProductoSerializers(serializers.ModelSerializer):
    class Meta:
        model = TipoProducto
        fields = '__all__'


class ProductoSerializers(serializers.ModelSerializer):
    ##AGREGAMOS LAS FK

    tipo = TipoProductoSerializers(read_only=True)

    class Meta:
        model = Producto
        fields = '__all__'


class EstadoSerializers(serializers.ModelSerializer):
    class Meta:
        model = Estado
        fields = '__all__'


class CompraSerializers(serializers.ModelSerializer):
    class Meta:
        model = Compra
        fields = '__all__'

# SERIEALIZER - VIEWSET - URL