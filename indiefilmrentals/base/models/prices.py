from django.db import models

class Price_Tier(models.model):
    level = models.IntegerField()
    percent = models.FloatField()

class Price_Tier_Package(models.model):
    tier = models.ManyToMany(Price_Tier)
