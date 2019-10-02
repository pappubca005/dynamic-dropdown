from django import forms

from .models import Person

app_name="myapp"
class PersonForm(forms.ModelForm):
    class Meta:
        model = Person
        fields=('name','phone', 'address', 'country', 'city')
