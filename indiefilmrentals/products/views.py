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
    categoryObj = get_object_or_404(Category,slug__iexact=slug)
    products = BaseIndieRentalProduct.objects.filter(categories=categoryObj, status=BaseIndieRentalProduct.LIVE_STATUS)
    subcategories = Category.objects.filter(parent_category=categoryObj)

    return render_to_response('base/category.html',
            {
                'categories': Category.objects.all().order_by('name').filter(parent_category=None),
                'category': categoryObj,
                'products': products,
				'subcategories': subcategories,
				'gearClass': "current",
                'all_subs': Category.objects.all().order_by('parent_category').filter(parent_category__isnull=False),
			},
            context_instance=RequestContext(request))


def product(request, brand, slug, category):
    """ Default view for the nat """
    print 'here'
    productObj = get_object_or_404(BaseIndieRentalProduct,slug=slug, status=BaseIndieRentalProduct.LIVE_STATUS)
    parentCategory = productObj.categories.all()[0]
    if parentCategory.parent_category:
        parentCategory = parentCategory.parent_category

    c = RequestContext(request)
    #c.update(csrf(c))
    return render_to_response('base/product.html',
        {
            'product':productObj,
            'categories': Category.objects.all(),
			'category_link': parentCategory.get_absolute_url(),
			'gearClass': "current",
        },
        context_instance=c)
