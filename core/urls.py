
from django.urls import path, include
from .views import * 
from django.contrib.auth.decorators import login_required
from rest_framework import routers 

#Creamos rutas para la api
router = routers.DefaultRouter()
router.register('productos', ProductoViewset)
router.register('tipoproductos', TipoProductoViewset)
# URLS
urlpatterns = [
    path('api/', include(router.urls)),
    path('', index , name="index"),
    path('indexapi', indexapi , name="indexapi"),
    path('about/', about , name="about"),
    path('blog/', blog , name="blog"),
    path('carrito/', login_required(carrito), name="carrito"),
    path('checkout/', checkout , name="checkout"),
    path('detalle/', detalle , name="detalle"),
    path('oneProduct/<id>/', login_required(oneProduct) , name="oneProduct"),
    path('price/', price , name="price"),
    path('product/' , product , name="product"),
    path('prue/' , prue , name="prue"),
    path('seguimiento/', login_required(seguimiento), name="seguimiento"),
    path('registrar/', registrar , name="registrar"),
    path('suscripcion/', login_required(suscripcion) , name="suscripcion"),
    path('service/', service , name="service"),
    path('team/', team , name="team"),
    path('testimonio/', testimonio , name="testimonio"),
    
    #CRUD
    path('add/', login_required(add), name="add"),
    path('update/<id>/', update, name="update"),
    path('delete/<id>/', delete, name="delete"),

    path('deleteCarrito/<id>/', deleteCarrito, name="deleteCarrito"),
    path('deleteProducto/<id>/', deleteProducto, name="deleteProducto"),
    path('deleteSuscripcion/<id>/', deleteSuscripcion, name="deleteSuscripcion"),
    
    path('addSeguimiento/', addSeguimiento, name="addSeguimiento"),
    path('updateSeguimiento/<id>/', updateSeguimiento, name="updateSeguimiento"),
    #carrito
]
