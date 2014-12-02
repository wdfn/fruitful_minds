from django.conf.urls import patterns, url
from main import views

urlpatterns = patterns('',
    #index
    url(r'^$', views.index, name='index'),
    #index for redundancy
    url(r'^index.html', views.index, name='index'),
    #Students and Parents Dropdown
    #students
    url(r'^students.html', views.students, name='students'),
    #recipes
    url(r'^recipes.html', views.recipes, name='recipes'),
    #news
    url(r'^news.html', views.news, name='news'),
    #educators
    url(r'^educators.html', views.educators, name='educators'),
    #involved
    url(r'^involved.html', views.involved, name='involved'),
    #mission
    url(r'^mission.html', views.mission, name='mission'),
    #contact
    url(r'^contact.html', views.contact, name='contact'),
    #donate
    url(r'^donate.html', views.donate, name='donate'),
    #download curriculum
    url(r'^download/curriculum.html', views.download, name='download'),
    #send message
    url(r'^mail.cgi', views.mail, name='mail'),
    #services
    url(r'^services.html', views.services, name='services'),
    #supporters
    url(r'^supporters.html', views.supporters, name='supporters'),

    #team
    url(r'^team.html', views.team, name='team'),
    #allyson
    url(r'^team/allyson-cesario.html', views.allyson_cesario, name='allyson-cesario'),
    #paulina
    url(r'^team/paulina-altshuler.html', views.paulina_altshuler, name='paulina-altshuler'),
    #sarah
    url(r'^team/sarah-french.html', views.sarah_french, name='sarah-french'),
    #kai
    url(r'^team/kai-ouye.html', views.kai_ouye, name='kai-ouye'),
    #teresa
    url(r'^team/teresa-tucker.html', views.teresa_tucker, name='teresa-tucker'),
    #connie
    url(r'^team/connie-tien.html', views.connie_tien, name='connie-tien'),
    #eunice
    url(r'^team/eunice-lam.html', views.eunice_lam, name='eunice-lam'),
    #lauren
    url(r'^team/lauren-mcavoy.html', views.lauren_mcavoy, name='lauren-mcavoy'),


    #play for testing
    #TODO remove this before release
    url(r'^play.html', views.play, name='play'),
)
