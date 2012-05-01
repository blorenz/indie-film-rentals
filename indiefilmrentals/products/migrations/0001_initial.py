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
        ))
        db.send_create_signal('products', ['Price_Tier_Package'])

        # Adding M2M table for field tier on 'Price_Tier_Package'
        db.create_table('products_price_tier_package_tier', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('price_tier_package', models.ForeignKey(orm['products.price_tier_package'], null=False)),
            ('price_tier', models.ForeignKey(orm['products.price_tier'], null=False))
        ))
        db.create_unique('products_price_tier_package_tier', ['price_tier_package_id', 'price_tier_id'])

        # Adding model 'Lens'
        db.create_table('products_lens', (
            ('product_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['shop.Product'], unique=True, primary_key=True)),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('description_html', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('status', self.gf('django.db.models.fields.IntegerField')(default=2)),
            ('price_tier', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['products.Price_Tier_Package'])),
        ))
        db.send_create_signal('products', ['Lens'])

        # Adding M2M table for field crossSell on 'Lens'
        db.create_table('products_lens_crossSell', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('from_lens', models.ForeignKey(orm['products.lens'], null=False)),
            ('to_lens', models.ForeignKey(orm['products.lens'], null=False))
        ))
        db.create_unique('products_lens_crossSell', ['from_lens_id', 'to_lens_id'])

        # Adding M2M table for field links on 'Lens'
        db.create_table('products_lens_links', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('lens', models.ForeignKey(orm['products.lens'], null=False)),
            ('link', models.ForeignKey(orm['base.link'], null=False))
        ))
        db.create_unique('products_lens_links', ['lens_id', 'link_id'])

        # Adding model 'Camera'
        db.create_table('products_camera', (
            ('product_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['shop.Product'], unique=True, primary_key=True)),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('description_html', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('status', self.gf('django.db.models.fields.IntegerField')(default=2)),
            ('price_tier', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['products.Price_Tier_Package'])),
        ))
        db.send_create_signal('products', ['Camera'])

        # Adding M2M table for field crossSell on 'Camera'
        db.create_table('products_camera_crossSell', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('from_camera', models.ForeignKey(orm['products.camera'], null=False)),
            ('to_camera', models.ForeignKey(orm['products.camera'], null=False))
        ))
        db.create_unique('products_camera_crossSell', ['from_camera_id', 'to_camera_id'])

        # Adding M2M table for field links on 'Camera'
        db.create_table('products_camera_links', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('camera', models.ForeignKey(orm['products.camera'], null=False)),
            ('link', models.ForeignKey(orm['base.link'], null=False))
        ))
        db.create_unique('products_camera_links', ['camera_id', 'link_id'])

        # Adding model 'Lighting'
        db.create_table('products_lighting', (
            ('product_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['shop.Product'], unique=True, primary_key=True)),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('description_html', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('status', self.gf('django.db.models.fields.IntegerField')(default=2)),
            ('price_tier', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['products.Price_Tier_Package'])),
        ))
        db.send_create_signal('products', ['Lighting'])

        # Adding M2M table for field crossSell on 'Lighting'
        db.create_table('products_lighting_crossSell', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('from_lighting', models.ForeignKey(orm['products.lighting'], null=False)),
            ('to_lighting', models.ForeignKey(orm['products.lighting'], null=False))
        ))
        db.create_unique('products_lighting_crossSell', ['from_lighting_id', 'to_lighting_id'])

        # Adding M2M table for field links on 'Lighting'
        db.create_table('products_lighting_links', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('lighting', models.ForeignKey(orm['products.lighting'], null=False)),
            ('link', models.ForeignKey(orm['base.link'], null=False))
        ))
        db.create_unique('products_lighting_links', ['lighting_id', 'link_id'])

    def backwards(self, orm):
        # Deleting model 'Price_Tier'
        db.delete_table('products_price_tier')

        # Deleting model 'Price_Tier_Package'
        db.delete_table('products_price_tier_package')

        # Removing M2M table for field tier on 'Price_Tier_Package'
        db.delete_table('products_price_tier_package_tier')

        # Deleting model 'Lens'
        db.delete_table('products_lens')

        # Removing M2M table for field crossSell on 'Lens'
        db.delete_table('products_lens_crossSell')

        # Removing M2M table for field links on 'Lens'
        db.delete_table('products_lens_links')

        # Deleting model 'Camera'
        db.delete_table('products_camera')

        # Removing M2M table for field crossSell on 'Camera'
        db.delete_table('products_camera_crossSell')

        # Removing M2M table for field links on 'Camera'
        db.delete_table('products_camera_links')

        # Deleting model 'Lighting'
        db.delete_table('products_lighting')

        # Removing M2M table for field crossSell on 'Lighting'
        db.delete_table('products_lighting_crossSell')

        # Removing M2M table for field links on 'Lighting'
        db.delete_table('products_lighting_links')

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
        'products.camera': {
            'Meta': {'object_name': 'Camera'},
            'crossSell': ('django.db.models.fields.related.ManyToManyField', [], {'blank': 'True', 'related_name': "'crossSell_rel_+'", 'null': 'True', 'to': "orm['products.Camera']"}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'description_html': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'links': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': "orm['base.Link']", 'null': 'True', 'blank': 'True'}),
            'price_tier': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.Price_Tier_Package']"}),
            'product_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['shop.Product']", 'unique': 'True', 'primary_key': 'True'}),
            'status': ('django.db.models.fields.IntegerField', [], {'default': '2'})
        },
        'products.lens': {
            'Meta': {'object_name': 'Lens'},
            'crossSell': ('django.db.models.fields.related.ManyToManyField', [], {'blank': 'True', 'related_name': "'crossSell_rel_+'", 'null': 'True', 'to': "orm['products.Lens']"}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'description_html': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'links': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': "orm['base.Link']", 'null': 'True', 'blank': 'True'}),
            'price_tier': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.Price_Tier_Package']"}),
            'product_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['shop.Product']", 'unique': 'True', 'primary_key': 'True'}),
            'status': ('django.db.models.fields.IntegerField', [], {'default': '2'})
        },
        'products.lighting': {
            'Meta': {'object_name': 'Lighting'},
            'crossSell': ('django.db.models.fields.related.ManyToManyField', [], {'blank': 'True', 'related_name': "'crossSell_rel_+'", 'null': 'True', 'to': "orm['products.Lighting']"}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'description_html': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'links': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': "orm['base.Link']", 'null': 'True', 'blank': 'True'}),
            'price_tier': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['products.Price_Tier_Package']"}),
            'product_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['shop.Product']", 'unique': 'True', 'primary_key': 'True'}),
            'status': ('django.db.models.fields.IntegerField', [], {'default': '2'})
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
            'tier': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['products.Price_Tier']", 'symmetrical': 'False'})
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