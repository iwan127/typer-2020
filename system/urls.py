from django.urls import path
import rest_framework 

from . import views as sys_v
from django.conf.urls import url

router = rest_framework.routers.DefaultRouter()
router.register('users', sys_v.UserViewSet)

urlpatterns = [
#     path('', router.urls),
    url(r'^register/$', sys_v.RegisterView.as_view(), name='register'),
]
