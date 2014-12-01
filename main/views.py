from django.shortcuts import render
from django.http import HttpResponse
from django.template import RequestContext, loader
from main.models import MessageBar

# Create your views here.
def index(request):
        latest_message = MessageBar.objects.order_by('-pub_date')[0]
        context = {'latest_message' : latest_message}
        return render(request, 'main/index.html', context)

def students(request):
	template = loader.get_template('main/students.html')
	context = RequestContext(request, None)

	return HttpResponse(template.render(context))

def recipes(request):
	template = loader.get_template('main/recipes.html')
	context = RequestContext(request, None)

	return HttpResponse(template.render(context))

def news(request):
	template = loader.get_template('main/news.html')
	context = RequestContext(request, None)

	return HttpResponse(template.render(context))

def play(request):
	template = loader.get_template('main/play.html')
	context = RequestContext(request, None)

	return HttpResponse(template.render(context))

def educators(request):
        template = loader.get_template('main/educators.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

def involved(request):
        template = loader.get_template('main/involved.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

def mission(request):
        template = loader.get_template('main/mission.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

def contact(request):
        template = loader.get_template('main/contact.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

def donate(request):
        template = loader.get_template('main/donate.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

