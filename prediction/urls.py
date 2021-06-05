from django.urls import path
from django.conf.urls import url, include

from . import views as pre_v

urlpatterns = [
#     url(r'(?P<pk>\d+)/$', pre_v.PredictionListView.as_view(), name='prediction_list'),
    url(r'ranking/$', pre_v.RankingListView.as_view(), name='prediction_ranking'),
    url(r'match/$', pre_v.PredictionMatchListPreviewView.as_view(), name='prediction_match_list'),
    url(r'extra/answers/all/$', pre_v.AnswerAllListView.as_view(), name='answer_all_list'),
    url(r'extra/answers/$', pre_v.AnswerListView.as_view(), name='answer_list'),
    url(r'extra/$', pre_v.ExtraQuestionListView.as_view(), name='extra_question_list'),
#     url(r'(?P<pk>[0-9]+)/$', pre_v.PredictionListPreviewView.as_view(), name='prediction_edit'),
    url(r'$', pre_v.PredictionListView.as_view(), name='prediction_list')
]
