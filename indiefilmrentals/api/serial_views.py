# Django imports
from django import http
from django.views.generic.detail import BaseDetailView
from django.views.generic.detail import SingleObjectTemplateResponseMixin as SOTRM
from django.views.generic.list import BaseListView
from django.views.generic.list import MultipleObjectTemplateResponseMixin as MOTRM
from django.core import serializers

# More imports
from django.core.serializers import serialize
from django.utils.simplejson import dumps, loads, JSONEncoder
from django.db.models.query import QuerySet
from django.utils.functional import curry


##
# JSON Encoder class to encode models corectly
##
class DjangoJSONEncoder(JSONEncoder):
    def default(self, obj, *args, **kwargs):
        if isinstance(obj, QuerySet):
            # `default` must return a python serializable
            # structure, the easiest way is to load the JSON
            # string produced by `serialize` and return it
            return loads(serialize('json', obj, *args, **kwargs))
        return JSONEncoder.default(self, obj)

##
# XML Encoder class to encode models correctly
##


class DjangoXMLEncoder(object):
    pass

# Useful function
json_dumps = curry(dumps, cls=DjangoJSONEncoder)


##
# This is overly simple, we'll have to change it to provide a more complex
# and powerful conversion
##
class JSONResponseMixin(object):
    def render_to_response(self, context):
        return self.get_json_response(self.convert_context_to_json(context))

    def get_json_response(self, content, **httpresponse_kwargs):
        return http.HttpResponse(content,
                                 content_type='application/json',
                                 **httpresponse_kwargs)

    def convert_context_to_json(self, context):
        try:
            return json_dumps(context)
        except Exception as e:
            return "ERROR : %s" % e

##
# Same use as the JSONResponseMixin except it outputs XML
##


class XMLResponseMixin(object):
    def render_to_response(self, context):
        return self.get_xml_response(self.convert_context_to_xml(context))

    def get_xml_response(self, content, **httpresponse_kwargs):
        return http.HttpResponse(content,
                                 content_type='application/xml',
                                 **httpresponse_kwargs)

    def convert_context_to_xml(self, context):
        try:
            return serializers.serialize('xml', context)
        except:
            return ''


## A few basic JSON views will be handy ##
class JSONDetailView(JSONResponseMixin, BaseDetailView):
    pass


class JSONListView(JSONResponseMixin, BaseListView):
    pass


class XMLDetailView(XMLResponseMixin, BaseDetailView):
    pass


class XMLListView(XMLResponseMixin, BaseListView):
    pass


##
# A customizable function to be more "DRY"
##
def dirty_is_ajax(request):
    return request.is_ajax() or 'ajax' in request.GET

##
# Now some Hybrid views that return JSON or render a HTML template
# depending on the type of request (AJAX or not)
##

##
# Simple Mixin to allow us to serialize output to different formats
# such as XML or JSON
##


class HybridSerializedMixin(JSONResponseMixin, XMLResponseMixin):
    # What format to output for 'ajax' requests
    serialized_output = False
    # Default to JSON
    response_format = 'json'
    SUPPORTED_FORMATS = {'json': JSONResponseMixin, 'xml': XMLResponseMixin}

    def render_to_response(self, context):
        if not self.response_format in self.SUPPORTED_FORMATS:
            raise Exception('Unsupported serialization format : %s' % self.response_format)
        mixin = self.SUPPORTED_FORMATS[self.response_format]
        return mixin.render_to_response(self, context)


class HybridDetailView(HybridSerializedMixin, SOTRM, BaseDetailView):
    def render_to_response(self, context):
        # We chould change this to something more appropriate
        if dirty_is_ajax(self.request) or self.serialized_output:
            try:
                return HybridSerializedMixin.render_to_response(self, context)
            except:
                pass
        # Default
        return SOTRM.render_to_response(self, context)


class HybridListView(HybridSerializedMixin, MOTRM, BaseListView):
    def render_to_response(self, context):
        if dirty_is_ajax(self.request) or self.serialized_output:
            try:
                return HybridSerializedMixin.render_to_response(self, context)
            except:
                pass
        # Default
        return MOTRM.render_to_response(self, context)
