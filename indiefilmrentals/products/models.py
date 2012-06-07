from shop.models import Product
from django.db import models
from indiefilmrentals.base.models import Link

from markdown import markdown
from datetime import datetime
import md5

from imagekit.models import ImageSpec
from imagekit.processors import resize

PRODUCT_THUMBNAIL_SIZES = {
    # The defaults are inspired from the twitter's bootstrap thumbnail sizes
    'small': {'width': 80, 'height': 80},
    'medium': {'width': 260, 'height': 180},
    'large': {'width': 360, 'height': 268},
}


class ThumbnailImageSpec(ImageSpec):
    def __init__(self, width = None, height = None, format='PNG', image_field = 'image', extra_filters = []):
        ifilters = [resize.ResizeToFit(width, height)]
        ifilters.extend(extra_filters)
        super(ThumbnailImageSpec, self).__init__(ifilters, format=format, image_field = image_field)
        self.width = width
        self.height = height


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


class Brand(models.Model):
    name = models.CharField(max_length=100)

    def __unicode__(self):
        return self.name


def my_upload_to(instance, filename):
    prefix = 'products'

    # Get name from FKed model
#    name = instance.product.name

    filename = md5.new(str(datetime.now())).hexdigest() + '-' + filename
    return "%s/%s" % (prefix, filename)


class Rentable(models.Model):
    date_out = models.DateField()
    date_in = models.DateField()

    class Meta:
        abstract = True


class BaseIndieRentalProduct(Product):
    LIVE_STATUS = 1
    DRAFT_STATUS = 2
    OHD_ONLY_STATUS = 3
    STATUS_CHOICES = (
                      (LIVE_STATUS, 'Live'),
                      (DRAFT_STATUS, 'Draft'),
                      (OHD_ONLY_STATUS, 'OHD Only'),
                      )

    brand = models.ForeignKey(Brand)

    description = models.TextField()
    description_html = models.TextField(null=True, blank=True, editable=False)

    status = models.IntegerField(choices=STATUS_CHOICES, default=DRAFT_STATUS, help_text="Only 'Live' status will be publicly displayed.")

    crossSell = models.ManyToManyField('self', null=True, help_text="Products to be cross-sold with this product.", blank=True)

    price_tier = models.ForeignKey(Price_Tier_Package, help_text="The price tier package for this product.")

    links = models.ManyToManyField(Link, help_text="Links to include with this product.", null=True, blank=True)

    class Meta:
        pass

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


class ProductImage(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    image = models.ImageField(upload_to=my_upload_to)
    thumbnail_small = ThumbnailImageSpec(**PRODUCT_THUMBNAIL_SIZES['small'])
    thumbnail_large = ThumbnailImageSpec(**PRODUCT_THUMBNAIL_SIZES['large'])
    product = models.ForeignKey(BaseIndieRentalProduct)

