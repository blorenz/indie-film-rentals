from indiefilmrentals.products.models import *
from django.contrib import admin


class ProductAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ['name']}

    class Media:
        js = ("js/tinymce/jscripts/tiny_mce/tiny_mce.js", "js/tiny.js", )


admin.site.register(Lens, ProductAdmin)
admin.site.register(Lighting, ProductAdmin)
admin.site.register(Camera, ProductAdmin)
admin.site.register(Price_Tier)
admin.site.register(Price_Tier_Package)
