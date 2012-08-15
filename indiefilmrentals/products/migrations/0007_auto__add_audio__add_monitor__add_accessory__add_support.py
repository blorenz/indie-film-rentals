# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Audio'
        db.create_table('products_audio', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['Audio'])

        # Adding model 'Monitor'
        db.create_table('products_monitor', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['Monitor'])

        # Adding model 'Accessory'
        db.create_table('products_accessory', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['Accessory'])

        # Adding model 'Support'
        db.create_table('products_support', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['Support'])

    def backwards(self, orm):
        # Deleting model 'Audio'
        db.delete_table('products_audio')

        # Deleting model 'Monitor'
        db.delete_table('products_monitor')

        # Deleting model 'Accessory'
        db.delete_table('products_accessory')

        # Deleting model 'Support'
        db.delete_table('products_support')

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
            'Meta': {'object_name': 'Accessory', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.audio': {
            'Meta': {'object_name': 'Audio', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.baseindierentalproduct': {
            'Meta': {'object_name': 'BaseIndieRentalProduct', '_ormbases': ['shop.Product']},
            'brand': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.Brand']"}),
            'crossSell': ('django.db.models.fields.related.ManyToManyField', [], {'blank': 'True', 'related_name': "'crossSell_rel_+'", 'null': 'True', 'to': "orm['products.BaseIndieRentalProduct']"}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'description_html': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'links': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': "orm['base.Link']", 'null': 'True', 'blank': 'True'}),
            'price_tier': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.Price_Tier_Package']"}),
            'product_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['shop.Product']", 'unique': 'True', 'primary_key': 'True'}),
            'status': ('django.db.models.fields.IntegerField', [], {'default': '2'})
        },
        'products.brand': {
            'Meta': {'object_name': 'Brand'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'products.camera': {
            'Meta': {'object_name': 'Camera', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.lens': {
            'Meta': {'object_name': 'Lens', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.lighting': {
            'Meta': {'object_name': 'Lighting', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.monitor': {
            'Meta': {'object_name': 'Monitor', '_ormbases': ['products.BaseIndieRentalProduct']},
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
            'Meta': {'object_name': 'Support', '_ormbases': ['products.BaseIndieRentalProduct']},
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
            'unit_price': ('django.db.models.fields.DecimalField', [], {'default': "'0.00'", 'max_digits': '12', 'decimal_places': '2'})
        }
    }

    complete_apps = ['products']