""" Basic models, such as user profile """

from shop.models import Product
from django.db import models

class Book(Product):
    isbn = models.CharField(max_length=255)
    class Meta: pass

class BaseIndieRentalProduct(Product):
    LIVE_STATUS = 1
    DRAFT_STATUS = 2
    OHD_ONLY_STATUS = 3
    STATUS_CHOICES = (
                      (LIVE_STATUS, 'Live'),
                      (DRAFT_STATUS, 'Draft'),
                      (OHD_ONLY_STATUS, 'OHD Only'),
                      )  

    description = models.CharField()
    description_html = models.CharField(blank=True,editable=False)

    status = models.IntegerField(choices=STATUS_CHOICES, default=DRAFT_STATUS, help_text="Only 'Live' status will be publicly displayed.")
    
    crossSell = models.ManyToMany('self', null=True)
    



    price_tier = models.ForeignKey(Price_Tier)

