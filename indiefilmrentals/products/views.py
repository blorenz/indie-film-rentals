# Create your views here.
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from indiefilmrentals.products.models import *
from shop_simplecategories.models import *
from django.core.context_processors import csrf

def brand(request):
    """ Default view for the root """
    return render_to_response('base/home.html',
        context_instance=RequestContext(request))

def category(request, slug):
    categoryObj = get_object_or_404(Category,name__iexact=slug)
    products = BaseIndieRentalProduct.objects.filter(categories=categoryObj)

    return render_to_response('base/category.html',
            {
                'categories': Category.objects.all(),
                'category': categoryObj,
                'products': products,},
            context_instance=RequestContext(request))


def product(request, brand, slug, category):
    """ Default view for the nat """
    print 'here'
    productObj = get_object_or_404(BaseIndieRentalProduct,slug=slug)
    c = RequestContext(request)
    #c.update(csrf(c))
    return render_to_response('base/product.html',
        {
            'product':productObj,
            'categories': Category.objects.all(),
        },
        context_instance=c)
