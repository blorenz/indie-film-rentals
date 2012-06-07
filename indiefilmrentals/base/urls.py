"""urlconf for the base application"""

from django.conf.urls.defaults import url, patterns, include


urlpatterns = patterns('indiefilmrentals.base.views',
    url(r'^$', 'home', name='home'),
    (r'^accounts/', include('registration.backends.default.urls')),
    url(r'^rent/(?P<category>.*?)/(?P<brand>.*?)/(?P<slug>.*?)/?$', 'product', name='product_view'),
    url(r'^rent/(?P<category>.*?)/(?P<brand>.*?)/?$', 'brand', name='brand_view'),
    url(r'^rent/(?P<category>.*?)/?$', 'category', name='category_view'),
)
