from django.conf.urls import url

from . import views as mat_v

urlpatterns = [
    url(r'grouped/$', mat_v.MatchListGroupedView.as_view(), name='match_list_grouped'),
    url(r'(?P<pk>[0-9]+)/$', mat_v.MatchDetailsPreviewView.as_view(), name='match_details_preview'),
    url(r'$', mat_v.MatchListView.as_view(), name='match_list'),
]
