"""urlconf for the base application"""

from django.conf.urls.defaults import url, patterns, include


urlpatterns = patterns('indiefilmrentals.base.views',
    url(r'^$', 'home', name='home'),
    (r'^accounts/', include('registration.backends.default.urls')),
    url(r'(?P<slug>.*?)$', 'product', name='product_view'),
)
