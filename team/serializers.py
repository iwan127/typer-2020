from rest_framework import serializers
from . import models as tea_m


class TeamSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = tea_m.Team
        fields = ('id', 'name', 'shortname', 'logo', 'vertical_logo', )
