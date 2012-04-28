from django.db import models


class Link(models.model):
    anchor = models.CharField()
    url = models.CharField()

