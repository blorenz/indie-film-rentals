from indiefilmrentals.products.models import *
from django.contrib import admin
from shop_simplecategories.admin import ProductWithCategoryForm


class ProductTierAdmin(admin.ModelAdmin):
    filter_horizontal = ['tier', ]


class ProductForm(ProductWithCategoryForm):
        class Meta(object):
                    model = BaseIndieRentalProduct
                    ordering = ['name',]

class ProductImageInline(admin.TabularInline):
    model = ProductImage


class ProductAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ['name']}
    filter_horizontal = ['crossSell', 'links']
    radio_fields = {"price_tier": admin.VERTICAL}
    form = ProductForm

    inlines = [ ProductImageInline, ]

    class Media:
        js = ("js/tinymce/jscripts/tiny_mce/tiny_mce.js", "js/tiny.js", )


admin.site.register(Lens, ProductAdmin)
admin.site.register(Lighting, ProductAdmin)
admin.site.register(Camera, ProductAdmin)
admin.site.register(Monitor, ProductAdmin)
admin.site.register(Accessory, ProductAdmin)
admin.site.register(Audio, ProductAdmin)
admin.site.register(Support, ProductAdmin)
admin.site.register(Price_Tier)
admin.site.register(Price_Tier_Package, ProductTierAdmin)
admin.site.register(Brand)
admin.site.register(ProductImage)
