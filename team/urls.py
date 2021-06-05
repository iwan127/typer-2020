from django.urls import path
from django.conf.urls import url, include

from . import views as tea_v

urlpatterns = [
    url(r'$', tea_v.TeamListView.as_view(), name='team_list'),
]
