from shop.models import Product
from django.db import models
from indiefilmrentals.base.models import Link


class Price_Tier(models.Model):
    start_day = models.IntegerField()
    end_day = models.IntegerField()
    level = models.IntegerField()
    percent = models.FloatField()


class Price_Tier_Package(models.Model):
    tier = models.ManyToManyField(Price_Tier)


class BaseIndieRentalProduct(Product):
    LIVE_STATUS = 1
    DRAFT_STATUS = 2
    OHD_ONLY_STATUS = 3
    STATUS_CHOICES = (
                      (LIVE_STATUS, 'Live'),
                      (DRAFT_STATUS, 'Draft'),
                      (OHD_ONLY_STATUS, 'OHD Only'),
                      )

    description = models.TextField()
    description_html = models.TextField(blank=True, editable=False)

    status = models.IntegerField(choices=STATUS_CHOICES, default=DRAFT_STATUS, help_text="Only 'Live' status will be publicly displayed.")

    crossSell = models.ManyToManyField('self', null=True)

    price_tier = models.ForeignKey(Price_Tier)

    links = models.ManyToManyField(Link)

    class Meta:
        pass
