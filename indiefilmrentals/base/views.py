""" Views for the base application """

from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from indiefilmrentals.products.models import *
from shop_simplecategories.models import *
from .utils import send_email_to_ohiohd

def home(request):
    """ Default view for the root """
    return render_to_response('base/home.html',
            {
				'featured': BaseIndieRentalProduct.objects.filter(featured_product=True),
				'homeClass': "current",
            },
        context_instance=RequestContext(request))

def gear(request):
    """ Default view for the root """
    return render_to_response('base/gear.html',
            {
                'categories': Category.objects.all().order_by('name').filter(parent_category=None),
				'featured': BaseIndieRentalProduct.objects.filter(featured_product=True),
				'gearClass': "current",
            },
        context_instance=RequestContext(request))

def services(request):
    """ Default view for the root """
    return render_to_response('base/services.html',
        {
            'servicesClass': "current",
        },
        context_instance=RequestContext(request))

def contact(request):
    """ Default view for the root """
    d = {
            'contactClass': "current", 
        }

    if request.method == 'POST':
        kwargs = {
                'name': request.POST.get('name', ''),
                'email': request.POST.get('email',''),
                'phone': request.POST.get('phone',''),
                'message': request.POST.get('message',''),
                'rental': request.POST.get('rental',''),
                'crews': request.POST.get('crews',''),
                'services': request.POST.get('services',''),
                'other': request.POST.get('other',''),
                    }
        send_email_to_ohiohd(**kwargs)
        d['email_sent'] = True

        
    return render_to_response('base/contact.html',
            d,
        context_instance=RequestContext(request))


def crews(request):
    """ Default view for the root """
    return render_to_response('base/crews.html',
        {
            'crewsClass': "current",
        },
        context_instance=RequestContext(request))

def crew_terms(request):
    """ Default view for the root """
    return render_to_response('base/crews.terms.html',
        {
            'crewsClass': "current",
        },
        context_instance=RequestContext(request))

def downloads(request):
    """ Default view for the root """
    return render_to_response('base/downloads.html',
        {},
        context_instance=RequestContext(request))

def rental_terms(request):
    """ Default view for the root """
    return render_to_response('base/rental.terms.html',
        {},
        context_instance=RequestContext(request))
