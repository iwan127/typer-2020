from rest_framework import serializers
from . import models as pla_m


class StadiumSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = pla_m.Stadium
        fields = ('name', 'city', )
