from django.views.generic import base as django_views

class BaseView(django_views.View):
	pass


class BaseTemplateView(django_views.TemplateView, BaseView):
	pass
