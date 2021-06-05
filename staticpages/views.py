from rest_framework import generics

from . import models as sta_m
from . import serializers as sta_s
from system import permissions as sys_p


class RulesView(generics.RetrieveAPIView):
    serializer_class = sta_s.RulesSerializer
    # permission_classes = (sys_p.AuthPermission, )
    queryset = sta_m.Rules.objects.all()
    
    def get_object(self):
        return self.get_queryset().first()
