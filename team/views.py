from django.shortcuts import render
from . import models as tea_m
from . import serializers as tea_s
from system import permissions as sys_p
from rest_framework import generics

class TeamListView(generics.ListAPIView):
    serializer_class = tea_s.TeamSerializer
    permission_classes = (sys_p.AuthPermission, )
    queryset = tea_m.Team.objects.all()
