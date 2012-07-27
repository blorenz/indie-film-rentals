
"""urlconf for the base application"""

from django.conf.urls.defaults import url, patterns, include


urlpatterns = patterns('indiefilmrentals.products.views',
    url(r'^(?P<category>.*?)/(?P<brand>.*?)/(?P<slug>.*?)$', 'product', name='product_view'),
    url(r'^(?P<category>.*?)/(?P<brand>.*?)$', 'brand', name='brand_view'),
    url(r'^(?P<slug>.*?)$', 'category', name='category_detail'),
)
