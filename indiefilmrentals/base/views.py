""" Views for the base application """

from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from indiefilmrentals.products.models import *
from shop_simplecategories.models import *

def home(request):
    """ Default view for the root """
    return render_to_response('base/home.html',
            {
                'categories': Category.objects.all(),
                },
        context_instance=RequestContext(request))

