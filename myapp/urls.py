from django.http import HttpResponse
from django.urls import path
from myapp.views import index,add_person,get_city

app_name="myapp"
urlpatterns = [
    path('', index, name='index'),
    path('person/', add_person, name='add-person'),
    path('get-city/<id>', get_city, name='get-city'),

]