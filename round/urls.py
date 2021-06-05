from django.conf.urls import url

from . import views as rou_v

urlpatterns = [
    url(r'groups/details/$', rou_v.GroupsDetailsListView.as_view(), name='groups_details_list'),
    url(r'$', rou_v.RoundListView.as_view(), name='round_list'),
]
