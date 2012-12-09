# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Price_Tier'
        db.create_table('products_price_tier', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('start_day', self.gf('django.db.models.fields.IntegerField')()),
            ('end_day', self.gf('django.db.models.fields.IntegerField')()),
            ('percent', self.gf('django.db.models.fields.FloatField')()),
        ))
        db.send_create_signal('products', ['Price_Tier'])

        # Adding model 'Price_Tier_Package'
        db.create_table('products_price_tier_package', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('products', ['Price_Tier_Package'])

        # Adding M2M table for field tier on 'Price_Tier_Package'
        db.create_table('products_price_tier_package_tier', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('price_tier_package', models.ForeignKey(orm['products.price_tier_package'], null=False)),
            ('price_tier', models.ForeignKey(orm['products.price_tier'], null=False))
        ))
        db.create_unique('products_price_tier_package_tier', ['price_tier_package_id', 'price_tier_id'])

        # Adding model 'Brand'
        db.create_table('products_brand', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('products', ['Brand'])

        # Adding model 'BaseIndieRentalProduct'
        db.create_table('products_baseindierentalproduct', (
            ('product_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['shop.Product'], unique=True, primary_key=True)),
            ('brand', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['products.Brand'])),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('description_html', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('status', self.gf('django.db.models.fields.IntegerField')(default=2)),
            ('price_tier', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['products.Price_Tier_Package'])),
        ))
        db.send_create_signal('products', ['BaseIndieRentalProduct'])

        # Adding M2M table for field crossSell on 'BaseIndieRentalProduct'
        db.create_table('products_baseindierentalproduct_crossSell', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('from_baseindierentalproduct', models.ForeignKey(orm['products.baseindierentalproduct'], null=False)),
            ('to_baseindierentalproduct', models.ForeignKey(orm['products.baseindierentalproduct'], null=False))
        ))
        db.create_unique('products_baseindierentalproduct_crossSell', ['from_baseindierentalproduct_id', 'to_baseindierentalproduct_id'])

        # Adding M2M table for field links on 'BaseIndieRentalProduct'
        db.create_table('products_baseindierentalproduct_links', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('baseindierentalproduct', models.ForeignKey(orm['products.baseindierentalproduct'], null=False)),
            ('link', models.ForeignKey(orm['base.link'], null=False))
        ))
        db.create_unique('products_baseindierentalproduct_links', ['baseindierentalproduct_id', 'link_id'])

        # Adding model 'Lens'
        db.create_table('products_lens', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['Lens'])

        # Adding model 'Camera'
        db.create_table('products_camera', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['Camera'])

        # Adding model 'Lighting'
        db.create_table('products_lighting', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['Lighting'])

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

        # Adding model 'Support'
        db.create_table('products_support', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['Support'])

        # Adding model 'Accessory'
        db.create_table('products_accessory', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['Accessory'])

        # Adding model 'ProductImage'
        db.create_table('products_productimage', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('image', self.gf('django.db.models.fields.files.ImageField')(max_length=100)),
            ('product', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['products.BaseIndieRentalProduct'])),
        ))
        db.send_create_signal('products', ['ProductImage'])


    def backwards(self, orm):
        # Deleting model 'Price_Tier'
        db.delete_table('products_price_tier')

        # Deleting model 'Price_Tier_Package'
        db.delete_table('products_price_tier_package')

        # Removing M2M table for field tier on 'Price_Tier_Package'
        db.delete_table('products_price_tier_package_tier')

        # Deleting model 'Brand'
        db.delete_table('products_brand')

        # Deleting model 'BaseIndieRentalProduct'
        db.delete_table('products_baseindierentalproduct')

        # Removing M2M table for field crossSell on 'BaseIndieRentalProduct'
        db.delete_table('products_baseindierentalproduct_crossSell')

        # Removing M2M table for field links on 'BaseIndieRentalProduct'
        db.delete_table('products_baseindierentalproduct_links')

        # Deleting model 'Lens'
        db.delete_table('products_lens')

        # Deleting model 'Camera'
        db.delete_table('products_camera')

        # Deleting model 'Lighting'
        db.delete_table('products_lighting')

        # Deleting model 'Audio'
        db.delete_table('products_audio')

        # Deleting model 'Monitor'
        db.delete_table('products_monitor')

        # Deleting model 'Support'
        db.delete_table('products_support')

        # Deleting model 'Accessory'
        db.delete_table('products_accessory')

        # Deleting model 'ProductImage'
        db.delete_table('products_productimage')


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