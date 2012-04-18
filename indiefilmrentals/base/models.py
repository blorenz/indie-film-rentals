""" Basic models, such as user profile """

from shop.models import Product
from django.db import models

class Book(Product):
    isbn = models.CharField(max_length=255)
    class Meta: pass

