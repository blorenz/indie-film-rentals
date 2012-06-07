""" Views for the base application """

from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from indiefilmrentals.products.models import *
from shop_simplecategories.models import *

def home(request):
    """ Default view for the root """
    return render_to_response('base/home.html',
        context_instance=RequestContext(request))

def brand(request, category, brand):
    """ Default view for the root """
    return render_to_response('base/home.html',
        context_instance=RequestContext(request))

def category(request, category):
    categoryObj = Category.objects.filter(name=category)
    products = BaseIndieRentalProduct.objects.filter(categories__in=categoryObj)

    return render_to_response('base/category.html',
            {'category': categoryObj, 'products': products,},
            context_instance=RequestContext(request))


def product(request, brand, slug, category):
    """ Default view for the nat """
    cameras = Camera.objects.all()
    images = ProductImage.objects.filter(product=cameras[0].id)
    print images[0]
    return render_to_response('base/product.html',
        {'product':cameras[0],
            'image': images[0],
        'name':'Cameras',},
        context_instance=RequestContext(request))
