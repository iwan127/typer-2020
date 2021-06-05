from rest_framework import serializers
from . import models as mat_m
from team import serializers as tea_s
from places import serializers as pla_s
from round import serializers as rou_s


class ScoreSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = mat_m.Score
        fields = ('regular', 'et', 'penalty', 'regular_home', 'regular_away', 'winner', )


class MatchBaseSerializer(serializers.HyperlinkedModelSerializer):
    teamHome = tea_s.TeamSerializer()
    teamAway = tea_s.TeamSerializer()
    stadium = pla_s.StadiumSerializer()
    score = ScoreSerializer()
    predictionEnabled = serializers.BooleanField(source='prediction_enabled')

    class Meta:
        model = mat_m.Match
        fields = ('id', 'datetime', 'teamHome', 'teamAway', 'stadium', 'score', 'predictionEnabled', )


class MatchSerializer(MatchBaseSerializer):
    groupObj = rou_s.GroupBaseSerializer(source='group')
    roundObj = rou_s.RoundSerializer(source='round')
    
    class Meta(MatchBaseSerializer.Meta):
        fields = MatchBaseSerializer.Meta.fields + ('groupObj', 'roundObj', )
