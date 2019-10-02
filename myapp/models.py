from django.db import models

app_name="myapp"

# Create your models here.
class Country(models.Model):
    name=models.CharField(max_length=50, null=True)

    def __str__(self):
        return self.name

class City(models.Model):
    name=models.CharField(max_length=50)
    country=models.ForeignKey(Country,on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.name

class Person(models.Model):
    name=models.CharField(max_length=50)
    phone=models.IntegerField()
    address=models.CharField(max_length=80)
    country=models.ForeignKey(Country,on_delete=models.CASCADE, null=True)
    city=models.ForeignKey(City,on_delete=models.CASCADE, null=True)
    
    def __str__(self):
        return self.name 
    


