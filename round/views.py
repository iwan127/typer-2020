from . import models as rou_m
from . import serializers as rou_s
from system import permissions as sys_p
from rest_framework import generics
from rest_framework.response import Response
from _collections import OrderedDict
from textwrap import indent


class GroupsDetailsListView(generics.ListAPIView):
    serializer_class = rou_s.GroupTeamSerializer
    permission_classes = (sys_p.AuthPermission, )
    queryset = rou_m.GroupTeam.objects.all().order_by('group__name', 'position', 'team__name')
    
    def group_in_list(self, group_list, group):
        ind = 0
        prev_id = None
        for gr in group_list:
            cur_id = list(gr.values())[0]
            if cur_id == group.get('id'):
                return ind
            elif cur_id != prev_id:
                ind = ind + 1
            prev_id = cur_id
        return None
    
    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        
        groups = []
        # 'id', 'teamObj', 'groupObj', 'points', 'goals_scored', 'goals_conceded', 'matches', )
        for team_group in serializer.data:
            group_obj = team_group.get('groupObj')
            ind = self.group_in_list(groups, group_obj)
            if ind is None:
                ind = len(groups)
                groups.append(group_obj)
            if 'teams' not in groups[ind]:
                groups[ind]['teams'] = [];
            team_obj = team_group.get('teamObj')
            if team_obj:
                team_info = {
                    'team': team_obj,
                    'points': team_group.get('points'),
                    'goalsScored': team_group.get('goals_scored'),
                    'goalsConceded': team_group.get('goals_conceded'),
                    'matches': team_group.get('matches'),
                    'position': team_group.get('position')
                }
                groups[ind]['teams'].append(team_info)
        
        return Response(groups)


class RoundListView(generics.ListAPIView):
    serializer_class = rou_s.RoundSerializer
    permission_classes = (sys_p.AuthPermission, )
    queryset = rou_m.Round.objects.all()
