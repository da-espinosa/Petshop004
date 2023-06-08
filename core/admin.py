from django.contrib import admin
from .models import *


class ProductoAdmin(admin.ModelAdmin):
    list_display  = ['nombre','descripcion','precio','stock','tipo']
    search_fields = ['nombre']
    list_per_page = 3

class ClienteAdmin(admin.ModelAdmin):
    list_display  = ['user','contrasena','nombre','apellido']
    search_fields = ['nombre']
    list_per_page = 3

class SubscripcionAdmin(admin.ModelAdmin):
    list_display  = ['correo','user']
    search_fields = ['user']
    list_per_page = 3

admin.site.register(TipoProducto)
admin.site.register(Producto,ProductoAdmin)
admin.site.register(Cliente,ClienteAdmin)
admin.site.register(Comentario)
admin.site.register(Subscripcion)