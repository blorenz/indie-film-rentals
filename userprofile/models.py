from django.db import models
from registration.models import RegistrationProfile

# Create your models here.
class UserProfile(RegistrationProfile):
    stripe_customer_id = models.CharField(max_length=255, blank=True, null=True)
