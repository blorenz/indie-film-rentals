""" Default urlconf for indiefilmrentals """

from django.conf import settings
from django.conf.urls.defaults import include, patterns, url
from session_csrf import anonymous_csrf
from django.contrib import admin
from shop import urls as shop_urls # <-- Add this at the top
from haystack.views import SearchView
admin.autodiscover()

# django-session-csrf monkeypatcher
import session_csrf
session_csrf.monkeypatch()


def bad(request):
    """ Simulates a server error """
    1 / 0

urlpatterns = patterns('',
    (r'^admin/doc/', include('django.contrib.admindocs.urls')),
    (r'^admin/$', anonymous_csrf(admin.site.admin_view(admin.site.index))),
    (r'^admin/', include(admin.site.urls)),
    #url(r'^', include('debug_toolbar_user_panel.urls')),
    (r'^bad/$', bad),
    (r'^shop/', include(shop_urls)), # <-- That's the important bit
    (r'^rent/', include('indiefilmrentals.products.urls')),
    (r'^pages/', include('django.contrib.flatpages.urls')),
    url(r'^search/', SearchView(template='base/search.html'), name='haystack_search'),
    (r'', include('indiefilmrentals.base.urls')),
)

## In DEBUG mode, serve media files through Django.
if settings.DEBUG:
    # Remove leading and trailing slashes so the regex matches.
    media_url = settings.MEDIA_URL.lstrip('/').rstrip('/')
    urlpatterns += patterns('',
        (r'^%s/(?P<path>.*)$' % media_url, 'django.views.static.serve',
         {'document_root': settings.MEDIA_ROOT}),
    )
