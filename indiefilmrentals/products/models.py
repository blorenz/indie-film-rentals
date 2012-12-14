from shop.models import Product
from django.db import models
from indiefilmrentals.base.models import Link

from markdown import markdown
from datetime import datetime
import md5


def my_upload_to(instance, filename):
    prefix = 'products'

    # Get name from FKed model
#    name = instance.product.name

    #filename = md5.new(str(datetime.now())).hexdigest() + '-' + filename
    return "%s/%s" % (prefix, filename)


class Price_Tier(models.Model):
    start_day = models.IntegerField(help_text="Lower limit of price tier's range")
    end_day = models.IntegerField(help_text="Upper limit of price tier's range")
    percent = models.FloatField(help_text="Percentage of product base value to apply for this tier.")

    def __unicode__(self):
        return "Days: %d - %d : %s%%" % (self.start_day, self.end_day, str(self.percent), )

    class Meta:
        verbose_name = "Price Tier"


class Price_Tier_Package(models.Model):
    tier = models.ManyToManyField(Price_Tier)
    name = models.CharField(max_length=100)

    def __unicode__(self):
        return "Tier Package: %s" % (self.name,)

    class Meta:
        verbose_name = "Price Tier Package"


class ProductImage(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(null=True,blank=True)
    image = models.ImageField(upload_to=my_upload_to)

    def __unicode__(self):
        return self.name


class Brand(models.Model):
    name = models.CharField(max_length=100)

    class Meta:
        ordering = ['name',]

    def __unicode__(self):
        return self.name


class BaseIndieRentalProduct(Product):
    LIVE_STATUS = 1
    DRAFT_STATUS = 2
    OHD_ONLY_STATUS = 3
    STATUS_CHOICES = (
                      (LIVE_STATUS, 'Live'),
                      (DRAFT_STATUS, 'Draft'),
                      (OHD_ONLY_STATUS, 'OHD Only'),
                      )

    brand = models.ForeignKey(Brand, null=True, blank=True)

    quantity = models.IntegerField(default=0)

    short_description = models.TextField(null=True, blank=True)
    description = models.TextField(null=True, blank=True)
    description_html = models.TextField(null=True, blank=True, editable=False)

    status = models.IntegerField(choices=STATUS_CHOICES, default=DRAFT_STATUS, help_text="Only 'Live' status will be publicly displayed.")

    crossSell = models.ManyToManyField('self', null=True, help_text="Products to be cross-sold with this product.", blank=True)

    price_tier = models.ForeignKey(Price_Tier_Package, help_text="The price tier package for this product.", null=True, blank=True)

    links = models.ManyToManyField(Link, help_text="Links to include with this product.", null=True, blank=True)

    ohd_daily = models.CharField(max_length=100,null=True,blank=True)
    ohd_weekly = models.CharField(max_length=100,null=True,blank=True)
    ohd_monthly = models.CharField(max_length=100,null=True,blank=True)

    image = models.ForeignKey(ProductImage, null=True, blank=True)


    def get_product_image(self):
        try:
            return self.productimage_set.all()[0]
        except:
            return None


    class Meta:
        ordering = ['name',]

    @models.permalink
    def get_absolute_url(self):
            return ('indiefilmrentals.products.views.product', (), {
                                        'brand': unicode(self.brand).lower(),
                                        'category': unicode(self.categories.all()[0]).lower() if len(self.categories.all()) else 'none',
                                        'slug': self.slug})

    def save(self, force_insert=False, force_update=False):
        self.description_html = markdown(self.description)
        super(BaseIndieRentalProduct, self).save(force_insert, force_update)


class Lens(BaseIndieRentalProduct):
    class Meta:
        verbose_name_plural = 'Lenses'


class Camera(BaseIndieRentalProduct):
    class Meta:
        pass


class Lighting(BaseIndieRentalProduct):
    class Meta:
        pass

class Audio(BaseIndieRentalProduct):
    class Meta:
        pass


class Monitor(BaseIndieRentalProduct):
    class Meta:
        pass


class Support(BaseIndieRentalProduct):
    class Meta:
        pass


class Accessory(BaseIndieRentalProduct):
    class Meta:
        verbose_name_plural = "Accessories"


class ProductImage(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(null=True,blank=True)
    image = models.ImageField(upload_to=my_upload_to)

