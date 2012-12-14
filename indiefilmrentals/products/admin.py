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
    list_display = ['name','ohd_category','ohd_subcategory','categories',]
    filter_horizontal = ['crossSell', 'links']
    radio_fields = {"price_tier": admin.VERTICAL}
    form = ProductForm

    #inlines = [ ProductImageInline, ]

    class Media:
        js = ("js/tinymce/jscripts/tiny_mce/tiny_mce.js", "js/tiny.js", )


admin.site.register(Lens, ProductAdmin)
admin.site.register(Lighting, ProductAdmin)
admin.site.register(Camera, ProductAdmin)
admin.site.register(Monitor, ProductAdmin)
admin.site.register(Accessory, ProductAdmin)
admin.site.register(Audio, ProductAdmin)
admin.site.register(Support, ProductAdmin)
admin.site.register(BatteryAndPower, ProductAdmin)
admin.site.register(DigitalRecorderMediaVTR, ProductAdmin)
admin.site.register(EditAndTransferSystem, ProductAdmin)
admin.site.register(Grip, ProductAdmin)
admin.site.register(MatteBoxFollowFocusFilter, ProductAdmin)
admin.site.register(MultiCameraSwitcherPackage, ProductAdmin)
admin.site.register(OtherService, ProductAdmin)
admin.site.register(TapeStock, ProductAdmin)
admin.site.register(Teleprompter, ProductAdmin)
admin.site.register(TimecodeAndSignalConversion, ProductAdmin)
admin.site.register(TripodDollySupportRig, ProductAdmin)
admin.site.register(VideoProjection, ProductAdmin)
admin.site.register(Price_Tier)
admin.site.register(Price_Tier_Package, ProductTierAdmin)
admin.site.register(Brand)
admin.site.register(ProductImage)
