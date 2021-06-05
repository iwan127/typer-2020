from django.conf.urls import url

from . import views as sta_v

urlpatterns = [
    url(r'rules/$', sta_v.RulesView.as_view(), name='rules_view'),
]
