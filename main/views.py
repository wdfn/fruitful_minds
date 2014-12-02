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

def download(request):
        template = loader.get_template('main/download/curriculum.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

def mail(request):
        template = loader.get_template('main/mail.cgi')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

def services(request):
        template = loader.get_template('main/services.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

def supporters(request):
        template = loader.get_template('main/supporters.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

def team(request):
        template = loader.get_template('main/team.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

def allyson_cesario(request):
        template = loader.get_template('main/team/allyson-cesario.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

def paulina_altshuler(request):
        template = loader.get_template('main/team/paulina-altshuler.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

def sarah_french(request):
        template = loader.get_template('main/team/sarah-french.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

def kai_ouye(request):
        template = loader.get_template('main/team/kai-ouye.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))

def teresa_tucker(request):
        template = loader.get_template('main/team/teresa-tucker.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))


def connie_tien(request):
        template = loader.get_template('main/team/connie-tien.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))


def eunice_lam(request):
        template = loader.get_template('main/team/eunice-lam.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))


def lauren_mcavoy(request):
        template = loader.get_template('main/team/lauren-mcavoy.html')
        context = RequestContext(request, None)

        return HttpResponse(template.render(context))