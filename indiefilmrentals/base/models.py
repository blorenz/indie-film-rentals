from django.db import models
from shop_simplecategories.models import *

class Link(models.Model):
    anchor = models.CharField(max_length=200)
    url = models.URLField()

    def __unicode__(self):
        return "%s | %s" % (self.anchor, self.url, )
