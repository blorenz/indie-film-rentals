""" Views for the base application """

from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from indiefilmrentals.products.models import Camera


def home(request):
    """ Default view for the root """
    return render_to_response('base/home.html',
        context_instance=RequestContext(request))


def product(request, slug):
    """ Default view for the nat """
    """ This is an awesome product view """


    p = get_object_or_404(Camera, slug=slug)

    # cameras = Camera.objects.all()
