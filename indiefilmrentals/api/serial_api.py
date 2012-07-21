from indiefilmrentals.base.models import *
from indiefilmrentals.products.models import *
from indiefilmrentals.api.serial_views import HybridDetailView, HybridListView

from session_csrf import anonymous_csrf_exempt
from django.utils.decorators import method_decorator

import json

from haystack.query import SearchQuerySet


XOR_KEY = 0x93B2E392A502C32D
AES_KEY = 'funtimes'



class BaseAPIListView(HybridListView):
    serialized_output = True
    # Default to JSON
    response_format = 'json'

    @method_decorator(anonymous_csrf_exempt)
    def dispatch(self, *args, **kwargs):
                return super(BaseAPIListView, self).dispatch(*args, **kwargs)

    def post(self, request, *args, **kwargs):
            return self.get(request, *args, **kwargs)


class BaseAPIDetailView(HybridDetailView):
    serialized_output = True
    # Default to JSON
    response_format = 'json'


def throw_error(error=500):
    context = {}
    context.setdefault('status', 'error')
    return context


class SubmoduleListView(BaseAPIListView):
    context_object_name = 'submodules'
    queryset = Submodule.objects.select_related()

    def get_queryset(self):
        st = {}
        kwargs = {}

        try:
            st = json.loads(self.request.raw_post_data)

            # module/slides/list
            the_id = st.get('module', None)
            kwargs['module__id'] = the_id

            qs = self.queryset.filter(**kwargs)
        except:
            qs = self.queryset

        return qs

    def get_context_data(self, **kwargs):
        old_context = super(SubmoduleListView, self).get_context_data(**kwargs)
        context = {}
        context['submodules'] = []
        for x in list(old_context['submodules']):
            if x.title == "Base":
                pass
            else:
                context['submodules'].append({"title": x.title,
                                             "id": x.id,
                                            })
        return context


class SlidesListView(BaseAPIListView):
    context_object_name = 'slides'
    queryset = Slide.objects.select_related()

    def get_queryset(self):
        st = {}
        kwargs = {}

        try:
            st = json.loads(self.request.raw_post_data)

            # module/slides/list
            the_id = st.get('id', None)
            kwargs['submodule__module__id'] = the_id

            qs = self.queryset.filter(**kwargs)
        except:
            qs = self.queryset

        return qs

    def get_context_data(self, **kwargs):
        old_context = super(SlidesListView, self).get_context_data(**kwargs)
        context = {}
        context['slides'] = create_slides_list(old_context['slides'])
        return context


class PresentationListView(BaseAPIListView):
    context_object_name = 'presentations'
    queryset = Presentation.objects.select_related()

    def get_queryset(self):

        try:
            qs = self.queryset.filter(user=PresentationUser.objects.get(user=self.request.user))
            qs = qs.filter(active=True)
        except:
            qs = Presentation.objects.none()

        return qs

    def get_context_data(self, **kwargs):
        old_context = super(PresentationListView, self).get_context_data(**kwargs)
        context = {}
        context['status'] = 'success'

        context['presentations'] = create_presentations_list(old_context['presentations'])
        return context


class TestSlidesListView(BaseAPIListView):
    serialized_output = False
    template = 'base/test_module.html'
    context_object_name = 'slides'
    queryset = Slide.objects.select_related()

    def get_queryset(self):
        kwargs = {}
        the_id = 4
        try:
    #        st = json.loads(self.request.raw_post_data)

            # module/slides/list
            kwargs['submodule__module__id'] = the_id

            qs = self.queryset.filter(**kwargs)
        except:
            qs = self.queryset

        return qs

    def get_context_data(self, **kwargs):
        old_context = super(TestSlidesListView, self).get_context_data(**kwargs)
        context = {}
        context['slides'] = create_slides_list(old_context['slides'])
        return context


class FeedbackEmailView(BaseAPIListView):
    context_object_name = 'feedback'
    queryset = Slide.objects.select_related()

    def get_queryset(self):
        st = json.loads(self.request.raw_post_data)
        message = st.get('message', 'No message')

        try:
            user = PresentationUser.objects.get(user=self.request.user)
        except:
            user = PresentationUser.objects.get(user__username='anon')

        qs = self.queryset

        return qs

    def get_context_data(self, **kwargs):
        old_context = super(FeedbackEmailView, self).get_context_data(**kwargs)
        context = {}
        context['success'] = "true"
        return context


class PresentationSaveView(BaseAPIListView):
    context_object_name = 'presentation'
    queryset = Slide.objects.select_related()
    errors = {}

    def get_queryset(self):
        st = json.loads(self.request.raw_post_data)
        print st
        name = st.get('name', 'unnamed')
        welcome_slide = st.get('welcome_title',7)
        presenter_name = st.get('presenter_name','')
        presenter_audience = st.get('presenter_audience','')
        title_override = st.get('title_override',False)

        try:
            user = PresentationUser.objects.get(user=self.request.user)
        except:
            user = PresentationUser.objects.get(user__username='anon')

        title = PresentationTitle.objects.get(pk=int(welcome_slide))

        if 'id' in st:
            j = int(AESdecrypt(AES_KEY,str(st['id'])))
            pres = Presentation.objects.get(pk=j)
            pres.user = user
            pres.title = title
            pres.presenter_name = presenter_name
            pres.presenter_audience = presenter_audience
            pres.title_override = title_override
            pres.save()
        else:
            if not len(Presentation.objects.filter(user=user, name__iexact=name)):
                pres = Presentation.objects.create(user=user, title=title, name=name, presenter_name=presenter_name, presenter_audience=presenter_audience, title_override=title_override)
            else:
                self.errors = {'error': 'duplicate_name'}
                return

        pres.slide_set.clear()

        for k, i in enumerate(st['slides']):
            PresentationSlide.objects.create(presentation=pres, slide=Slide.objects.get(pk=i['id']), slide_order=k)

        qs = Presentation.objects.filter(pk=pres.id)

        return qs

    def get_context_data(self, **kwargs):
        old_context = super(PresentationSaveView, self).get_context_data(**kwargs)
        context = {}
        if not len(self.errors):
            context['success'] = "true"
            context['id'] = AESencrypt(AES_KEY,str(list(old_context['presentation'])[0].id))
        else:
            context['success'] = "false"
            context['message'] = 'A presentation already exists with that name.'
            context['errors'] = self.errors
        return context


class PresentationShareListView(BaseAPIListView):
    context_object_name = 'slides'
    queryset = PresentationUser.objects.select_related()
    users = []

    def get_queryset(self):
        st = {}
        kwargs = {}

        #try:
        st = json.loads(self.request.raw_post_data)

        the_id = st.get('id', None)
        the_id = int(AESdecrypt(AES_KEY,the_id))
        kwargs['presentation__id'] = the_id

        try:
            obj = Presentation.objects.get(pk=the_id)
            self.users = get_share_presenters(obj)

            #TESTING
            self.users = [ { 'SpeakerId': x.speaker_id,
                            'FirstName': x.user.first_name,
                            'LastName': x.user.last_name,
                            } for x in PresentationUser.objects.filter(id__lte=11).filter(id__gte=4).order_by('user__last_name') ]
        except:
            pass
        qs = Slide.objects.none()

        return qs

    def get_context_data(self, **kwargs):
        old_context = super(PresentationShareListView, self).get_context_data(**kwargs)
        context = {}
        new_slides = []
        context['users'] = [{
                            'id': AESencrypt(AES_KEY,str(x['SpeakerId'])),
                            'name': x['FirstName'] + ' ' + x['LastName'],
                            } for x in self.users ]
        return context


class PresentationShareView(BaseAPIListView):
    context_object_name = 'slides'
    queryset = PresentationUser.objects.select_related()
    users = []

    def get_queryset(self):
        st = {}
        kwargs = {}

        #try:
        st = json.loads(self.request.raw_post_data)

        the_id = st.get('id', None)
        the_user = st.get('user', None)
        the_id = int(AESdecrypt(AES_KEY,the_id))
        the_user = int(AESdecrypt(AES_KEY,the_user))

        kwargs['presentation__id'] = the_id

        try:
            obj = Presentation.objects.get(pk=the_id)
            share_presentation(obj,PresentationUser.objects.get(speaker_id=the_user))
        except:
            pass

        qs = Slide.objects.none()

        return qs

    def get_context_data(self, **kwargs):
        old_context = super(PresentationShareView, self).get_context_data(**kwargs)
        context = {}
        new_slides = []
        context['success'] = "true"
        return context


class PresentationOpenView(BaseAPIListView):
    context_object_name = 'slides'
    queryset = Slide.objects.select_related()

    def get_queryset(self):
        st = {}
        kwargs = {}

        #try:
        st = json.loads(self.request.raw_post_data)
        self.title = None

        the_id = st.get('id', None)
        the_id = int(AESdecrypt(AES_KEY,the_id))
        kwargs['presentation__id'] = the_id

        self.title = None
        self.title_override = None
        self.presenter_name = None
        self.presenter_audience = None

        try:
            qs = self.queryset.filter(**kwargs).order_by('presentation')
            obj = Presentation.objects.get(pk=the_id)
            self.title = obj.title.id
            self.title_override = obj.title_override
            self.presenter_name = obj.presenter_name
            self.presenter_audience = obj.presenter_audience
        except:
            qs = Slide.objects.none()


        return qs

    def get_context_data(self, **kwargs):
        old_context = super(PresentationOpenView, self).get_context_data(**kwargs)
        context = {}
        new_slides = []
        context['welcome_slide'] = self.title
        context['title_override'] = self.title_override
        context['presenter_name'] = self.presenter_name
        context['presenter_audience'] = self.presenter_audience
        context['slides'] = create_slides_list(old_context['slides'])
        return context


class PresentationPrintView(BaseAPIListView):
    context_object_name = 'slides'
    serialized_output = False
    template_name = 'base/print.html'
    queryset = Slide.objects.select_related()

    def get_queryset(self, **kwargs):
        st = {}
        kwargs = {}

        try:
            st = self.kwargs
        except:
            pass

        the_id = st.get('id', None)
        the_id = int(AESdecrypt(AES_KEY,the_id))

        self.the_type = PRINTING[int(st.get('type', 1))]

        kwargs['presentation__id'] = the_id

        try:
            qs = self.queryset.filter(**kwargs).order_by('presentation')
        except:
            qs = Slide.objects.none()

        return qs

    def get_context_data(self, **kwargs):
        old_context = super(PresentationPrintView, self).get_context_data(**kwargs)
        context = {}
        context['print_type'] = self.the_type + '.html'
        context['slides'] = create_slides_list(old_context['slides'])
        return context


class PresentationDownloadView(BaseAPIListView):
    context_object_name = 'slides'
    serialized_output = False
    template_name = 'base/download.html'
    queryset = Slide.objects.select_related()

    def get_queryset(self):
        st = {}
        kwargs = {}

        try:
            st = json.loads(self.request.raw_post_data)
        except:
            pass

        #the_id = st.get('id', None)
        the_id = st.get('id', 'c75a0a2758486d7a3f300da3824bce326744d598835666e3a8e1cf1cf7a5efe4904a56ede2b37b68b0d83c9aeae4c1bd4c49bfb75bceb54b21ccb7fff21b71c2')
        the_id = int(AESdecrypt(AES_KEY,the_id))
        kwargs['presentation__id'] = the_id

        try:
            qs = self.queryset.filter(**kwargs).order_by('presentation')
        except:
            qs = Slide.objects.none()

        return qs

    def get_context_data(self, **kwargs):
        old_context = super(PresentationPrintView, self).get_context_data(**kwargs)
        context = {}
        context['print_type'] = 'slides-with-notes.html'
        context['slides'] = create_slides_list(old_context['slides'])
        return context


class SearchListView(BaseAPIListView):
    context_object_name = 'results'

    def get_queryset(self):
        try:
            st = json.loads(self.request.raw_post_data)
        except:
            pass

        text = st.get('query', None)
        qs = SearchQuerySet().filter(content=text)

        return qs

    def get_context_data(self, **kwargs):
        old_context = super(SearchListView, self).get_context_data(**kwargs)
        context = {}
        context['slides'] = create_slides_list([x.object for x in old_context['results']])
        return context


class TitlesListView(BaseAPIListView):
    context_object_name = 'titles'
    queryset = PresentationTitle.objects.select_related()

    def get_queryset(self):
        qs = self.queryset

        return qs

    def get_context_data(self, **kwargs):
        old_context = super(TitlesListView, self).get_context_data(**kwargs)
        context = {}
        new_slides = []
        for k in list(old_context['titles']):
            new_slides.append({
                'id': k.id,
                'title': k.title,
                'module': k.module_set.all()[0].id if k.module_set.all() else -1,
                })
        context['titles'] = new_slides
        return context
        return context
