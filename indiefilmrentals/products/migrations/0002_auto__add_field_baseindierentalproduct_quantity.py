# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'BaseIndieRentalProduct.quantity'
        db.add_column('products_baseindierentalproduct', 'quantity',
                      self.gf('django.db.models.fields.IntegerField')(default=0),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'BaseIndieRentalProduct.quantity'
        db.delete_column('products_baseindierentalproduct', 'quantity')


    models = {
        'base.link': {
            'Meta': {'object_name': 'Link'},
            'anchor': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'url': ('django.db.models.fields.URLField', [], {'max_length': '200'})
        },
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'products.accessory': {
            'Meta': {'ordering': "['name']", 'object_name': 'Accessory', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.audio': {
            'Meta': {'ordering': "['name']", 'object_name': 'Audio', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.baseindierentalproduct': {
            'Meta': {'ordering': "['name']", 'object_name': 'BaseIndieRentalProduct', '_ormbases': ['shop.Product']},
            'brand': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.Brand']"}),
            'crossSell': ('django.db.models.fields.related.ManyToManyField', [], {'blank': 'True', 'related_name': "'crossSell_rel_+'", 'null': 'True', 'to': "orm['products.BaseIndieRentalProduct']"}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'description_html': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'links': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': "orm['base.Link']", 'null': 'True', 'blank': 'True'}),
            'price_tier': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.Price_Tier_Package']"}),
            'product_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['shop.Product']", 'unique': 'True', 'primary_key': 'True'}),
            'quantity': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'status': ('django.db.models.fields.IntegerField', [], {'default': '2'})
        },
        'products.brand': {
            'Meta': {'ordering': "['name']", 'object_name': 'Brand'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'products.camera': {
            'Meta': {'ordering': "['name']", 'object_name': 'Camera', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.lens': {
            'Meta': {'ordering': "['name']", 'object_name': 'Lens', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.lighting': {
            'Meta': {'ordering': "['name']", 'object_name': 'Lighting', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.monitor': {
            'Meta': {'ordering': "['name']", 'object_name': 'Monitor', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.price_tier': {
            'Meta': {'object_name': 'Price_Tier'},
            'end_day': ('django.db.models.fields.IntegerField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'percent': ('django.db.models.fields.FloatField', [], {}),
            'start_day': ('django.db.models.fields.IntegerField', [], {})
        },
        'products.price_tier_package': {
            'Meta': {'object_name': 'Price_Tier_Package'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'tier': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['products.Price_Tier']", 'symmetrical': 'False'})
        },
        'products.productimage': {
            'Meta': {'object_name': 'ProductImage'},
            'description': ('django.db.models.fields.TextField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'product': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.BaseIndieRentalProduct']"})
        },
        'products.support': {
            'Meta': {'ordering': "['name']", 'object_name': 'Support', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'shop.product': {
            'Meta': {'object_name': 'Product'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'date_added': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'polymorphic_ctype': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'polymorphic_shop.product_set'", 'null': 'True', 'to': "orm['contenttypes.ContentType']"}),
            'slug': ('django.db.models.fields.SlugField', [], {'unique': 'True', 'max_length': '50'}),
            'unit_price': ('django.db.models.fields.DecimalField', [], {'default': "'0.0'", 'max_digits': '30', 'decimal_places': '2'})
        }
    }

    complete_apps = ['products']