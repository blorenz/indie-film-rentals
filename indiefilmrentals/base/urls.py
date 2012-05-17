"""urlconf for the base application"""

from django.conf.urls.defaults import url, patterns


urlpatterns = patterns('indiefilmrentals.base.views',
    url(r'^$', 'home', name='home'),
    url(r'^nat$', 'nat', name='nat'),
)
