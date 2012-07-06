from indiefilmrentals.base.models import *
from django.contrib import admin
from registration.models import *
from djcelery.models import *
from django.contrib.auth.models import *

from django.contrib.flatpages.models import FlatPage
from django.contrib.flatpages.admin import FlatPageAdmin as FlatPageAdminBase

admin.site.register(Link)
#admin.site.unregister(RegistrationProfile)
admin.site.unregister(CrontabSchedule)
admin.site.unregister(IntervalSchedule)
admin.site.unregister(PeriodicTask)
admin.site.unregister(TaskState)
admin.site.unregister(WorkerState)

#admin.site.unregister(User)
#admin.site.unregister(Group)



class FlatPageAdmin(FlatPageAdminBase):
    class Media:
        js = ('js/tinymce/jscripts/tiny_mce/tiny_mce.js',
              'js/tiny.js',)

admin.site.unregister(FlatPage)
admin.site.register(FlatPage, FlatPageAdmin)
