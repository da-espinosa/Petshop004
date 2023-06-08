
from django.urls import path, include
from .views import * 
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
    path('carrito/', carrito , name="carrito"),
    path('checkout/', checkout , name="checkout"),
    path('detalle/', detalle , name="detalle"),
    path('oneProduct/', oneProduct , name="oneProduct"),
    path('price/', price , name="price"),
    path('product/' , product , name="product"),
    path('prue/' , prue , name="prue"),
    path('seguimiento/', seguimiento , name="seguimiento"),
    path('registrar/', registrar , name="registrar"),
    path('subscripcion/', subscripcion , name="subscripcion"),
    path('service/', service , name="service"),
    path('team/', team , name="team"),
    path('testimonio/', testimonio , name="testimonio"),
    
    #CRUD
    path('add/', add, name="add"),
    path('update/<id>/', update, name="update"),
    path('delete/<id>/', delete, name="delete"),


    #carrito
]
