from indiefilmrentals.base.models import *
from django.contrib import admin
from registration.models import *
from djcelery.models import *
from django.contrib.auth.models import *

admin.site.register(Link)
#admin.site.unregister(RegistrationProfile)
admin.site.unregister(CrontabSchedule)
admin.site.unregister(IntervalSchedule)
admin.site.unregister(PeriodicTask)
admin.site.unregister(TaskState)
admin.site.unregister(WorkerState)

#admin.site.unregister(User)
#admin.site.unregister(Group)

