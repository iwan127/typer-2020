from rest_framework import serializers
from . import models as rou_m
from team import models as tea_m
from team import serializers as tea_s


class RoundSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = rou_m.Round
        fields = ('id', 'name', 'shortname', 'roundType', )


# class GroupTeamSerializer(serializers.HyperlinkedModelSerializer):
#     team = tea_s.TeamSerializer()
#     matches = MatchSerializer(many=True)
# 
#     class Meta:
#         model = rou_m.GroupTeam
#         fields = ('team', 'points', 'goals_scored', 'goals_conceded', 'matches', )


class GroupBaseSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = rou_m.Group
        fields = ('id', 'name', )


# class GroupSerializer(GroupBaseSerializer):
#     teamsObj = GroupTeamSerializer(source='teams', many=True)
#     
#     class Meta(GroupBaseSerializer.Meta):
#         fields = GroupBaseSerializer.Meta.fields + ('teamsObj', )


class GroupTeamSerializer(serializers.HyperlinkedModelSerializer):
    teamObj = tea_s.TeamSerializer(source='team')
    groupObj = GroupBaseSerializer(source='group')

    class Meta:
        model = rou_m.GroupTeam
        fields = ('teamObj', 'groupObj', 'points', 'goals_scored', 'goals_conceded', 'matches', 'position', )
