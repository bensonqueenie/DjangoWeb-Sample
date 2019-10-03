from django.shortcuts import render_to_response

# Create your views here.
def hello_world(request):
    
    data="Hello World";
    
    return render_to_response('hello_world.html', locals())