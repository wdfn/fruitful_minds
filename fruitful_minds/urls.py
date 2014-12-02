from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static

from main import views

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'fruitful_minds.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    #admin site
    url(r'^admin/', include(admin.site.urls)),

    #main app for the site
    url(r'^main/', include('main.urls', namespace = "main")),
                       
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

    #play for testing
    #TODO remove this before release
    url(r'^play.html', views.play, name='play'),
)

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
