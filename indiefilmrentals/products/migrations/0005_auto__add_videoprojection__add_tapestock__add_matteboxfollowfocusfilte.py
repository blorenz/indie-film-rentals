# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'VideoProjection'
        db.create_table('products_videoprojection', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['VideoProjection'])

        # Adding model 'TapeStock'
        db.create_table('products_tapestock', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['TapeStock'])

        # Adding model 'MatteBoxFollowFocusFilter'
        db.create_table('products_matteboxfollowfocusfilter', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['MatteBoxFollowFocusFilter'])

        # Adding model 'TimecodeAndSignalConversion'
        db.create_table('products_timecodeandsignalconversion', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['TimecodeAndSignalConversion'])

        # Adding model 'TripodDollySupportRig'
        db.create_table('products_tripoddollysupportrig', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['TripodDollySupportRig'])

        # Adding model 'MultiCameraSwitcherPackage'
        db.create_table('products_multicameraswitcherpackage', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['MultiCameraSwitcherPackage'])

        # Adding model 'OtherService'
        db.create_table('products_otherservice', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['OtherService'])

        # Adding model 'DigitalRecorderMediaVTR'
        db.create_table('products_digitalrecordermediavtr', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['DigitalRecorderMediaVTR'])

        # Adding model 'Grip'
        db.create_table('products_grip', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['Grip'])

        # Adding model 'Teleprompter'
        db.create_table('products_teleprompter', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['Teleprompter'])

        # Adding model 'BatteryAndPower'
        db.create_table('products_batteryandpower', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['BatteryAndPower'])

        # Adding model 'EditAndTransferSystem'
        db.create_table('products_editandtransfersystem', (
            ('baseindierentalproduct_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['products.BaseIndieRentalProduct'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('products', ['EditAndTransferSystem'])


    def backwards(self, orm):
        # Deleting model 'VideoProjection'
        db.delete_table('products_videoprojection')

        # Deleting model 'TapeStock'
        db.delete_table('products_tapestock')

        # Deleting model 'MatteBoxFollowFocusFilter'
        db.delete_table('products_matteboxfollowfocusfilter')

        # Deleting model 'TimecodeAndSignalConversion'
        db.delete_table('products_timecodeandsignalconversion')

        # Deleting model 'TripodDollySupportRig'
        db.delete_table('products_tripoddollysupportrig')

        # Deleting model 'MultiCameraSwitcherPackage'
        db.delete_table('products_multicameraswitcherpackage')

        # Deleting model 'OtherService'
        db.delete_table('products_otherservice')

        # Deleting model 'DigitalRecorderMediaVTR'
        db.delete_table('products_digitalrecordermediavtr')

        # Deleting model 'Grip'
        db.delete_table('products_grip')

        # Deleting model 'Teleprompter'
        db.delete_table('products_teleprompter')

        # Deleting model 'BatteryAndPower'
        db.delete_table('products_batteryandpower')

        # Deleting model 'EditAndTransferSystem'
        db.delete_table('products_editandtransfersystem')


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
            'brand': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.Brand']", 'null': 'True', 'blank': 'True'}),
            'crossSell': ('django.db.models.fields.related.ManyToManyField', [], {'blank': 'True', 'related_name': "'crossSell_rel_+'", 'null': 'True', 'to': "orm['products.BaseIndieRentalProduct']"}),
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'description_html': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'image': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.ProductImage']", 'null': 'True', 'blank': 'True'}),
            'links': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': "orm['base.Link']", 'null': 'True', 'blank': 'True'}),
            'ohd_daily': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'ohd_monthly': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'ohd_weekly': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'price_tier': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.Price_Tier_Package']", 'null': 'True', 'blank': 'True'}),
            'product_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['shop.Product']", 'unique': 'True', 'primary_key': 'True'}),
            'quantity': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'short_description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'status': ('django.db.models.fields.IntegerField', [], {'default': '2'})
        },
        'products.batteryandpower': {
            'Meta': {'ordering': "['name']", 'object_name': 'BatteryAndPower', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
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
        'products.digitalrecordermediavtr': {
            'Meta': {'ordering': "['name']", 'object_name': 'DigitalRecorderMediaVTR', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.editandtransfersystem': {
            'Meta': {'ordering': "['name']", 'object_name': 'EditAndTransferSystem', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.grip': {
            'Meta': {'ordering': "['name']", 'object_name': 'Grip', '_ormbases': ['products.BaseIndieRentalProduct']},
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
        'products.matteboxfollowfocusfilter': {
            'Meta': {'ordering': "['name']", 'object_name': 'MatteBoxFollowFocusFilter', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.monitor': {
            'Meta': {'ordering': "['name']", 'object_name': 'Monitor', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.multicameraswitcherpackage': {
            'Meta': {'ordering': "['name']", 'object_name': 'MultiCameraSwitcherPackage', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.otherservice': {
            'Meta': {'ordering': "['name']", 'object_name': 'OtherService', '_ormbases': ['products.BaseIndieRentalProduct']},
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
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'products.support': {
            'Meta': {'ordering': "['name']", 'object_name': 'Support', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.tapestock': {
            'Meta': {'ordering': "['name']", 'object_name': 'TapeStock', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.teleprompter': {
            'Meta': {'ordering': "['name']", 'object_name': 'Teleprompter', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.timecodeandsignalconversion': {
            'Meta': {'ordering': "['name']", 'object_name': 'TimecodeAndSignalConversion', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.tripoddollysupportrig': {
            'Meta': {'ordering': "['name']", 'object_name': 'TripodDollySupportRig', '_ormbases': ['products.BaseIndieRentalProduct']},
            'baseindierentalproduct_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['products.BaseIndieRentalProduct']", 'unique': 'True', 'primary_key': 'True'})
        },
        'products.videoprojection': {
            'Meta': {'ordering': "['name']", 'object_name': 'VideoProjection', '_ormbases': ['products.BaseIndieRentalProduct']},
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