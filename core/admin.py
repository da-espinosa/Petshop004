from django.contrib import admin
from .models import *


class ProductoAdmin(admin.ModelAdmin):
    list_display  = ['nombre','descripcion','precio','stock','tipo']
    search_fields = ['nombre']
    list_per_page = 3

class ClienteAdmin(admin.ModelAdmin):
    list_display  = ['user','nombre','apellido']
    search_fields = ['nombre']
    list_per_page = 3

class ComentarioAdmin(admin.ModelAdmin):
    list_display  = ['resena','user']
    search_fields = ['user']
    list_per_page = 3

class CarritoAdmin(admin.ModelAdmin):
    list_display  = ['cliente','producto','cantidad','vigente']
    search_fields = ['cliente']
    list_per_page = 3

class SuscripcionAdmin(admin.ModelAdmin):
    list_display  = ['cliente','correo','fecha']
    search_fields = ['cliente']
    list_per_page = 3

class EstadoAdmin(admin.ModelAdmin):
    list_display  = ['nombreEstado']
    search_fields = ['nombreEstado']
    list_per_page = 3


admin.site.register(TipoProducto)
admin.site.register(Producto,ProductoAdmin)
admin.site.register(Cliente,ClienteAdmin)
admin.site.register(Comentario,ComentarioAdmin)
admin.site.register(Carrito,CarritoAdmin)
admin.site.register(Suscripcion,SuscripcionAdmin)
admin.site.register(Estado,EstadoAdmin)
admin.site.register(Compra)