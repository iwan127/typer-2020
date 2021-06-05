from rest_framework import serializers
from . import models as sta_m


class RulesSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = sta_m.Rules
        fields = ('content', )
