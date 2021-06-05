from rest_framework import generics

from . import models as mat_m
from . import serializers as mat_s
from round import models as rou_m
from system import permissions as sys_p
from rest_framework.response import Response
from _collections import OrderedDict


class MatchListView(generics.ListAPIView):
    serializer_class = mat_s.MatchSerializer
    permission_classes = (sys_p.AuthPermission, )
    queryset = mat_m.Match.objects.all().order_by('datetime')


class MatchDetailsPreviewView(generics.RetrieveAPIView):
    queryset = mat_m.Match.objects.all()
    serializer_class = mat_s.MatchSerializer
    permission_classes = (sys_p.AuthPermission, )


class MatchListGroupedView(generics.ListAPIView):
    serializer_class = mat_s.MatchSerializer
    permission_classes = (sys_p.AuthPermission, )
    queryset = mat_m.Match.objects.all().order_by('round__roundType', 'group__name', 'datetime')

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        
        matches = OrderedDict()

        # grupowanie meczów:
        # - po rundzie
        # - po grupie, jeśli runda to faza grupowa
        for match in serializer.data:
            roundObj = match.get('roundObj')
            # print(roundObj)
            if roundObj:
                roundType = roundObj.get('roundType')
                roundId = roundObj.get('id')
                group = match.get('groupObj')
                if group and roundType == rou_m.Round.GROUPSTAGE:
                    if roundId not in matches.keys():
                        matches[roundId] = {'round': roundObj, 'groups': OrderedDict()}
                    if group:
                        groupId = group.get('id')
                        if groupId not in matches[roundId]['groups'].keys():
                            matches[roundId]['groups'][groupId] = {'group': group, 'matches': []}
                        matches[roundId]['groups'][groupId]['matches'].append(match)
                else:
                    if roundId not in matches.keys():
                        matches[roundId] = {'round': roundObj, 'matches': []}
                    matches[roundId]['matches'].append(match)
        for rnd in rou_m.Round.objects.all():
            if rnd.id not in matches.keys():
                matches[rnd.id] = {'round': {
                    'id': rnd.id,
                    'name': rnd.name,
                    'roundType': rnd.roundType
                }, 'matches': None}
        
        return Response(matches)
