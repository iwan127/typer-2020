"""typer URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.conf.urls import url, include
from django.urls import path

from system import views as sys_v
import prediction
from rest_framework import routers
from django.views.generic.base import View, TemplateView
from django.views.static import serve
from django.conf import settings
# router = routers.DefaultRouter()
# router.register('users', sys_v.UserViewSet)
from django.views.generic import RedirectView
from django.contrib.staticfiles.views import serve as sf_serve

urlpatterns = [
#     url('', include(router.urls)),
    url(r'^$', sf_serve, kwargs={'path': 'index.html'}),
    # path('about/', TemplateView.as_view(template_name="index.html")),
    path('admin/', admin.site.urls),
    url(r'^api/predictions/', include('prediction.urls')),
    url(r'^api/matches/', include('match.urls')),
    url(r'^api/rounds/', include('round.urls')),
    url(r'^api/pages/', include('staticpages.urls')),
    url(r'^api/teams/', include('team.urls')),
#     url(r'^auth/', include('system.urls')),
#     url(r'^auth/', include('rest_framework.urls')),
#    url(r'^password-reset/confirm/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
#            View.as_view(),
#    name='password_reset_confirm'),
    url(r'^auth/', include('rest_auth.urls')),
    url(r'^auth/registration/', include('rest_auth.registration.urls')),
#     url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^api/users/(?P<pk>[0-9]+)/preview/$', sys_v.UserDetailsPreviewView.as_view(), name='user_details_preview'),
    url(r'^api/users/(?P<pk>[0-9]+)/$', sys_v.UserDetailsView.as_view(), name='user_details'),
    url(r'^api/users/current/$', sys_v.CurrentUserInfoView.as_view(), name='current_user_info'),
#     url(r'^api/users/$', sys_v.UserListView.as_view(), name='user_list'),
    url(r'^tinymce/', include('tinymce.urls')),
#     url(r'^captcha/', include('captcha.urls')),
]

if settings.DEBUG:
    urlpatterns += [
        url(r'^media/teams/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_PATH + '/teams', }),
        url(r'^media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_PATH, }),
        url(r'^static/(?P<path>.*)$', serve, {'document_root': settings.STATIC_PATH, }),
    ]

urlpatterns += [
    url(r'^(?!/?static/)(?P<path>.*\..*)$', RedirectView.as_view(url='/static/%(path)s', permanent=False)),
]
