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

    #play for testing
    #TODO remove this before release
    url(r'^play.html', views.play, name='play'),
)
