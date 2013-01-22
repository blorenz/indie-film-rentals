
"""urlconf for the base application"""

from django.conf.urls.defaults import url, patterns, include


urlpatterns = patterns('indiefilmrentals.base.views',
    url(r'^$', 'home', name='home'),
    url(r'^gear/', 'gear', name='gear'),
    url(r'^services/', 'services', name='services'),
    url(r'^contact/', 'contact', name='contact'),
    url(r'^crews/', 'crews', name='crews'),
    url(r'^crew/terms/', 'crew_terms', name='crew_terms'),
    url(r'^downloads/', 'downloads', name='downloads'),
    url(r'^rental/terms/', 'rental_terms', name='rental_terms'),
    (r'^accounts/', include('registration.backends.default.urls')),
)
