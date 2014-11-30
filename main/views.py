from django.shortcuts import render
from django.http import HttpResponse
from django.template import RequestContext, loader

# Create your views here.
def index(request):
	return HttpResponse("Hello World. This is the index")

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