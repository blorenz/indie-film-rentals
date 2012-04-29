from django.db import models


class Link(models.Model):
    anchor = models.CharField(max_length=200)
    url = models.URLField()
