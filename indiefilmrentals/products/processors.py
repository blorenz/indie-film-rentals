from indiefilmrentals.products.models import *
from shop_simplecategories.models import *

def categories(request):
        return {'categories': Category.objects.all()}
