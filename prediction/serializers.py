from rest_framework import serializers
from . import models as pre_m
from match import models as mat_m
from match import serializers as mat_s
from round import serializers as rou_s
from system import serializers as sys_s


class PredictionBaseSerializer(serializers.HyperlinkedModelSerializer):
#     user = serializers.ReadOnlyField(source='user.username')
#     userObj = sys_s.UserBaseSerializer(source='user')
    matchId = serializers.PrimaryKeyRelatedField(queryset=mat_m.Match.objects.all(), source='match')
#     matchObj = mat_s.MatchBaseSerializer(source='match')
    goalsHome = serializers.IntegerField(source='goals_home', min_value=0)
    goalsAway = serializers.IntegerField(source='goals_away', min_value=0)

    class Meta:
        model = pre_m.Prediction
        fields = ('id', 'goalsHome', 'goalsAway', 'matchId', 'points', 'editable', )

#     def __init__(self, **kwargs):
#         super(PredictionSerializer, self).__init__(**kwargs)
#         if self.instance is not None:
#             self.instance.check_editable()


class PredictionSimpleSerializer(PredictionBaseSerializer):
    user = serializers.ReadOnlyField(source='user.username')
    
    class Meta(PredictionBaseSerializer.Meta):
        fields = PredictionBaseSerializer.Meta.fields + ('user', )


class PredictionSerializer(PredictionBaseSerializer):
    userObj = sys_s.UserBaseSerializer(source='user')
    
    class Meta(PredictionBaseSerializer.Meta):
        fields = PredictionBaseSerializer.Meta.fields + ('userObj', )


class AnswerSimpleSerializer(serializers.HyperlinkedModelSerializer):
    answer = serializers.CharField(source='answer_integer')
    questionId = serializers.IntegerField(source='question_id')
    
    class Meta:
        model = pre_m.ExtraQuestionsUserAnswers
        fields = ('id', 'answer', 'questionId', 'points', 'editable', )


class AnswersAllSerializer(AnswerSimpleSerializer):
    userObj = sys_s.UserBaseReadonlySerializer(source='user')
    
    class Meta(AnswerSimpleSerializer.Meta):
        fields = AnswerSimpleSerializer.Meta.fields + ('userObj', )


class UserPointsSerializer(serializers.HyperlinkedModelSerializer):
#     user = serializers.ReadOnlyField(source='user.username')
    userObj = sys_s.UserBaseSerializer(source='user')
    nExactScores = serializers.IntegerField(source='n_exact_scores')
    nResults = serializers.IntegerField(source='n_results')
    nExtraQuestions = serializers.IntegerField(source='n_extra_questions')

    class Meta:
        model = pre_m.UserPoints
        fields = ('id', 'userObj', 'points', 'nExactScores', 'nResults', 'nExtraQuestions', )


class ExtraQuestionSerializer(serializers.HyperlinkedModelSerializer):
    groupObj = rou_s.GroupBaseSerializer(source='group')

    class Meta:
        model = pre_m.ExtraQuestions
        fields = ('id', 'answer_enabled', 'close_datetime', 'text', 'points', 'answer_type', 'groupObj', )
