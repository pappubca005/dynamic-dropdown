from django.shortcuts import render
from django.http import HttpResponse
from myapp.models import City,Country,Person
from myapp.forms import PersonForm
from django.shortcuts import redirect

# Create your views here.

def index(request):
    country=Country.objects.all()
    context={
        'country':country,
    }
    #return HttpResponse("hey%s"%slug)
    return render(request, 'myapp/home.html', context)


def add_person(request):
    if request.method=="POST":
        form=PersonForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("/")
    else:
        form=PersonForm()
        context={
            'form':form,
        }
        return render(request, 'myapp/person.html', context)
def get_city(request,id):
    opt2_html = ""
    try:
        country=Country.objects.get(pk = id)
        city = City.objects.filter(country_id = country.id)
        # make_models  = company.makemodel_set.all()
        for c in city:
            opt2_html += "<option value='"+str(c.id)+"'>"+c.name+"</option>"
            print(opt2_html) 
            context={
            'country':country,
            'city':city,
            }
        
    except:
        write_exception("Error in fetching options 2")
    return HttpResponse(opt2_html)
    # return render(request, 'myapp/home.html', context)