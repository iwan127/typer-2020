from rest_framework import generics, permissions

from . import models as pre_m
from . import serializers as pre_s
from system import permissions as sys_p
from system import models as sys_m
from match import models as mat_m
from team import models as tea_m
from team import serializers as tea_s
from round import models as rou_m
from round import serializers as rou_s
from django.http.response import Http404
from rest_framework.response import Response
from rest_framework import status
from django.core.exceptions import PermissionDenied
from _collections import OrderedDict


class PredictionListView(generics.ListCreateAPIView):
    owner_id = None
    serializer_class = pre_s.PredictionSimpleSerializer
    permission_classes = (sys_p.PredictionsPermission, )

    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)
    
    def get_prediction_ids(self):
        prediction_ids = []
        for prediction in self.request.data:
            if prediction.get('id') is not None:
                prediction_ids.append(prediction['id'])
        return prediction_ids

    def check_save_permisssions(self):
        self.prepare_owner()
        if self.request.user is None or (self.owner_id is not None and self.owner_id != self.request.user.id):
            raise PermissionDenied()

    def update(self, request, *args, **kwargs):
        self.check_save_permisssions()
        partial = kwargs.pop('partial', False)
        
        prediction_ids = self.get_prediction_ids()

        prediction_instances = self.get_queryset().filter(id__in=prediction_ids, editable=True)
        resp_data = []
        for instance in prediction_instances:
#             pred_list = filter(lambda x: x.get['id'] == instance.id, request.data)
            pred_list = [pr for pr in request.data if pr.get('id') == instance.id]
            if len(pred_list) > 0:
                prediction = pred_list[0]
                if 'editable' in prediction:
                    del prediction['editable']
                serializer = self.get_serializer(instance, data=prediction, partial=partial)
                serializer.is_valid(raise_exception=True)
                serializer.save()
                resp_data.append(serializer.data)

            if getattr(instance, '_prefetched_objects_cache', None):
                instance._prefetched_objects_cache = {}

        return Response(resp_data)
    
    def create(self, request, *args, **kwargs):
        self.check_save_permisssions()
        if isinstance(request.data, list):
            resp_data = []
            for prediction in request.data:
                if prediction.get('goalsAway') is not None and prediction.get('goalsHome') is not None:
                    if 'editable' in prediction:
                        del prediction['editable']
                    prediction['user'] = self.request.user.id
                    serializer = self.get_serializer(data=prediction)
                    serializer.is_valid(raise_exception=True)
                    self.perform_create(serializer)
                    headers = self.get_success_headers(serializer.data)
                    resp_data.append(serializer.data)
            return Response(resp_data, status=status.HTTP_201_CREATED, headers=None)
        return super(PredictionListView, self).create(request, *args, **kwargs)

    def get_serializer_context(self):
        ctx = super(PredictionListView, self).get_serializer_context()
        ctx['many'] = True
        return ctx

    def prepare_owner(self):
        self.owner_id = self.request.GET.get('user', self.request.user.id)
        if not self.owner_id:
            raise Http404
        elif isinstance(self.owner_id, str):
            try:
                self.owner_id = int(self.owner_id)
            except ValueError:
                raise Http404
    
    def get_queryset(self):
        self.prepare_owner()
        if self.request and self.request.user:
            q = pre_m.Prediction.objects.filter(user_id=self.owner_id)
            if self.request.user.id != self.owner_id:
                # jeśli użytkownik, który wszedł na ten widok nie jest właścicielem typów, można pokazać jedynie zamknięte już typy
                q = q.filter(editable=False)
            return q
        return None

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class RankingListView(generics.ListAPIView):
    serializer_class = pre_s.UserPointsSerializer
    permission_classes = (sys_p.AuthPermission, )
    queryset = pre_m.UserPoints.objects.all()


class PredictionMatchListPreviewView(generics.ListAPIView):
    serializer_class = pre_s.PredictionSerializer
    permission_classes = (sys_p.AuthPermission, )

    def prepare_match(self):
        self.match_id = self.request.GET.get('match')
        if not self.match_id:
            raise Http404
        try:
            # możliwy jest podgląd tylko zamkniętych dla typowania meczów
            mat_m.Match.objects.get(id=self.match_id, prediction_enabled=False)
        except mat_m.Match.DoesNotExist:
            raise Http404
    
    def get_queryset(self):
        self.prepare_match()
        return pre_m.Prediction.objects.filter(editable=False, match_id=self.match_id)    

    def get_user_prediction(self, predictions, user):
        for pr in predictions:
            if pr.get('userObj').get('id') == user.id:
                return pr
        return None

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        
        all_users = sys_m.SystemUser.objects.filter(is_active=True).order_by('nickname', 'username')
        existing_predictions = list(serializer.data)
        predictions = []
        for user in all_users:
            pr = self.get_user_prediction(existing_predictions, user)
            if pr is not None:
                predictions.append(pr)
            else:
                pr = {
                    'id': None,
                    'goalsHome': None,
                    'goalsAway': None,
                    'matchId': self.match_id,
                    'points': None,
                    'editable': False,
                    'userObj': {
                        'id': user.id,
                        'username': user.username,
                        'avatar': user.avatar.url if user.avatar else None,
                        'nickname': user.nickname
                    }
                }
                predictions.append(pr)
        
        return Response(predictions)


class ExtraQuestionListView(generics.ListAPIView):
    serializer_class = pre_s.ExtraQuestionSerializer
    permission_classes = (sys_p.AuthPermission, )
    queryset = pre_m.ExtraQuestions.objects.all().order_by('id')

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        teams_objs = tea_m.Team.objects.all()
        teams = []
        for t in teams_objs:
            teams.append({
                'id': t.id,
                'name': t.name
            })
        group_teams = rou_m.GroupTeam.objects.all()
        rounds_objs = rou_m.Round.objects.all()
        rounds = []
        for r in rounds_objs:
            rounds.append({
                'id': r.id,
                'name': r.name
            })
        resp = []
        for q in serializer.data:
            a_type = int(q['answer_type'])
            if a_type in [pre_m.ExtraQuestions.AT_SELECT_TEAM, pre_m.ExtraQuestions.AT_SELECT_2_TEAMS, ]:
                q['possible_answers'] = teams
            elif a_type == pre_m.ExtraQuestions.AT_SELECT_2_TEAMS_GROUP:
                group_id = int(q['groupObj']['id'])
                gr_teams = group_teams.filter(group_id=group_id)
                p_ans = []
                for gr_t in gr_teams:
                    p_ans.append({
                        'id': gr_t.id,
                        'name': gr_t.team.name
                    })
                q['possible_answers'] = p_ans
            elif a_type == pre_m.ExtraQuestions.AT_SELECT_ROUND:
                q['possible_answers'] = rounds
            resp.append(q)
        
        return Response(resp)
#    'id', 'answer_enabled', 'close_datetime', 'text', 'points', 'answer_type')


class AnswerListView(generics.ListCreateAPIView):
    owner_id = None
    serializer_class = pre_s.AnswerSimpleSerializer
    permission_classes = (sys_p.OwnerPermission, )

    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)
    
    def get_answer_ids(self):
        answer_ids = []
        for answer in self.request.data:
            if answer.get('id') is not None:
                answer_ids.append(answer['id'])
        return answer_ids

    def check_save_permisssions(self):
        self.prepare_owner()
        if self.request.user is None or (self.owner_id is not None and self.owner_id != self.request.user.id):
            raise PermissionDenied()

    def update(self, request, *args, **kwargs):
        self.check_save_permisssions()
        partial = kwargs.pop('partial', False)
        
        answer_ids = self.get_answer_ids()

        answer_instances = self.get_queryset().filter(id__in=answer_ids, editable=True)
        resp_data = []
        for instance in answer_instances:
#             pred_list = filter(lambda x: x.get['id'] == instance.id, request.data)
            ans_list = [ans for ans in request.data if ans.get('id') == instance.id]
            if len(ans_list) > 0:
                answer = ans_list[0]
                if 'editable' in answer:
                    del answer['editable']
                if 'points' in answer:
                    del answer['points']
                serializer = self.get_serializer(instance, data=answer, partial=partial)
                serializer.is_valid(raise_exception=True)
                serializer.save()
                resp_data.append(serializer.data)

            if getattr(instance, '_prefetched_objects_cache', None):
                instance._prefetched_objects_cache = {}

        return Response(resp_data)
    
    def create(self, request, *args, **kwargs):
        self.check_save_permisssions()
        if isinstance(request.data, list):
            resp_data = []
            for answer in request.data:
                if answer.get('answer') is not None:
                    if 'editable' in answer:
                        del answer['editable']
                    answer['user'] = self.request.user.id
                    serializer = self.get_serializer(data=answer)
                    serializer.is_valid(raise_exception=True)
                    self.perform_create(serializer)
                    headers = self.get_success_headers(serializer.data)
                    resp_data.append(serializer.data)
            return Response(resp_data, status=status.HTTP_201_CREATED, headers=None)
        return super(AnswerListView, self).create(request, *args, **kwargs)

    def get_serializer_context(self):
        ctx = super(AnswerListView, self).get_serializer_context()
        ctx['many'] = True
        return ctx

    def prepare_owner(self):
        self.owner_id = self.request.GET.get('user', self.request.user.id)
        if not self.owner_id:
            raise Http404
        elif isinstance(self.owner_id, str):
            try:
                self.owner_id = int(self.owner_id)
            except ValueError:
                raise Http404
    
    def get_queryset(self):
        self.prepare_owner()
        if self.request and self.request.user:
            q = pre_m.ExtraQuestionsUserAnswers.objects.filter(user_id=self.owner_id)
            if self.request.user.id != self.owner_id:
                # jeśli użytkownik, który wszedł na ten widok nie jest właścicielem odpowiedzi, można pokazać jedynie zamknięte już typy
                q = q.filter(editable=False)
            return q
        return None

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class AnswerAllListView(AnswerListView):
    permission_classes = (sys_p.AuthPermission, )

    def check_save_permisssions(self):
        raise PermissionDenied()

    def get_queryset(self):
        if self.request and self.request.user:
            q = pre_m.ExtraQuestionsUserAnswers.objects.filter(editable=False)
            return q
        return None
