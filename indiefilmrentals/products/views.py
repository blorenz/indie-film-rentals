# Create your views here.
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from indiefilmrentals.products.models import *
from shop_simplecategories.models import *


def brand(request):
    """ Default view for the root """
    return render_to_response('base/home.html',
        context_instance=RequestContext(request))

def category(request, category):
    categoryObj = get_object_or_404(Category,name__iexact=category)
    products = BaseIndieRentalProduct.objects.filter(categories=categoryObj)

    return render_to_response('base/category.html',
            {'category': categoryObj, 'products': products,},
            context_instance=RequestContext(request))


def product(request, brand, slug, category):
    """ Default view for the nat """
    print 'here'
    productObj = get_object_or_404(BaseIndieRentalProduct,slug=slug)

    return render_to_response('base/product.html',
        {'product':productObj,
        },
        context_instance=RequestContext(request))
