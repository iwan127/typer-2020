from django.db import models
from django.db.models import Q
from django.utils.translation import ugettext_lazy as _

from utils import models as utils_models
from match import models as mat_m

class Round(utils_models.BaseModel):
    GROUPSTAGE = 1
    ROUND_OF_16 = 2
    QUATERFINAL = 3
    SEMIFINAL = 4
    THIRD_PLACE = 5
    FINAL = 6
    ROUND_TYPES = (
        (GROUPSTAGE, _('Faza grupowa')),
        (ROUND_OF_16, _('1/8 finału')),
        (QUATERFINAL, _('Ćwierćfinał')),
        (SEMIFINAL, _('Półfinał')),
        (THIRD_PLACE, _('Mecz o 3. miejsce')),
        (FINAL, _('Finał'))
    )
    
    name = models.CharField(verbose_name=_('Nazwa'), max_length=128)
    shortname = models.CharField(verbose_name=_('Nazwa skrócona'), max_length=16, default='')
    roundType = models.SmallIntegerField(verbose_name=_('Rodzaj'), choices=ROUND_TYPES)

    class Meta(utils_models.PermMeta):
        abstract = False
        verbose_name = _('Runda')
        verbose_name_plural = _('Rundy')

    def __str__(self):
        return self.name
        

class GroupTeam(utils_models.BaseModel):
    group = models.ForeignKey('Group', verbose_name=_('Grupa'), on_delete=models.CASCADE)
    team = models.ForeignKey('team.Team', verbose_name=_('Drużyna'), on_delete=models.CASCADE)
    points = models.SmallIntegerField(verbose_name=_('Punkty'), null=True, blank=True)
    goals_scored = models.SmallIntegerField(verbose_name=_('Gole strzelone'), null=True, blank=True)
    goals_conceded = models.SmallIntegerField(verbose_name=_('Gole stracone'), null=True, blank=True)
    matches = models.SmallIntegerField(verbose_name=_('Mecze'), null=True, blank=True)
    position = models.SmallIntegerField(verbose_name=_('Pozycja'), null=True, blank=True)

    class Meta(utils_models.PermMeta):
        abstract = False
        verbose_name = _('Drużyna w grupie')
        verbose_name_plural = _('Drużyny w grupie')

    def __str__(self):
        return self.group.name + ' | ' + self.team.name


class Group(utils_models.BaseModel):
    name = models.CharField(verbose_name=_('Nazwa'), max_length=128)
    teams = models.ManyToManyField('team.Team', verbose_name=_('Drużyny'), through='GroupTeam')
    
    class Meta(utils_models.PermMeta):
        abstract = False
        verbose_name = _('Grupa')
        verbose_name_plural = _('Grupy')

    def __str__(self):
        return self.name

    def get_team(self, teams, team):
        team_list = [i for i, t in enumerate(teams) if team.id == t.team.id]
        if len(team_list) > 0:
            return team_list[0]
        return None
    
    def calculate_table(self):
        matches = self.matches.filter(score__isnull=False)
        teams = list(GroupTeam.objects.filter(group_id=self.id))
        for team in teams:
            team.points = 0
            team.goals_scored = 0
            team.goals_conceded = 0
            team.matches = 0
            team.goals_diff = 0
        for match in matches:
            goals_h = match.score.regular_home
            goals_a = match.score.regular_away
            if goals_h > goals_a:
                points_h = 3
                points_a = 0
            elif goals_h < goals_a:
                points_h = 0
                points_a = 3
            else:
                points_h = 1
                points_a = 1
            th_ind = self.get_team(teams, match.teamHome)
            ta_ind = self.get_team(teams, match.teamAway)
            if th_ind is not None and ta_ind is not None:
                teams[th_ind].points = teams[th_ind].points + points_h
                teams[th_ind].goals_scored = teams[th_ind].goals_scored + match.score.regular_home
                teams[th_ind].goals_conceded = teams[th_ind].goals_conceded + match.score.regular_away
                teams[th_ind].matches = teams[th_ind].matches + 1
                teams[th_ind].goals_diff = teams[th_ind].goals_scored - teams[th_ind].goals_conceded
             
                teams[ta_ind].points = teams[ta_ind].points + points_a
                teams[ta_ind].goals_scored = teams[ta_ind].goals_scored + match.score.regular_away
                teams[ta_ind].goals_conceded = teams[ta_ind].goals_conceded + match.score.regular_home
                teams[ta_ind].matches = teams[ta_ind].matches + 1
                teams[ta_ind].goals_diff = teams[ta_ind].goals_scored - teams[ta_ind].goals_conceded
        if teams is not None and len(teams) > 0:
            sorted_teams = [teams[0]]
            for team in teams[1:len(teams)]:
                breaked = False
                for ind, s_team in enumerate(sorted_teams):
                    # najpierw sprawdzamy liczbę punktów
                    if s_team.points > team.points:
                        continue
                    elif s_team.points < team.points:
                        sorted_teams.insert(ind, team)
                        breaked = True
                        break
                    else:
                        # teraz sprawdzamy bilans bramek
                        if s_team.goals_diff > team.goals_diff:
                            continue
                        elif s_team.goals_diff < team.goals_diff:
                            sorted_teams.insert(ind, team)
                            breaked = True
                            break
                        else:
                            # teraz sprawdzamy liczbę bramek strzelonych
                            if s_team.goals_scored > team.goals_scored:
                                continue
                            elif s_team.goals_scored < team.goals_scored:
                                sorted_teams.insert(ind, team)
                                breaked = True
                                break
                            else:
                                # teraz sprawdzamy wynik bezpośredniiego meczu między drużynami
                                try:
                                    match = matches.get(Q(teamHome_id=s_team.id, teamAway_id=team.id) | Q(teamHome_id=team.id, teamAway_id=s_team.id) & Q(score__isnull=False))
                                except mat_m.Match.DoesNotExist:
                                    match = None
                                if match is not None:
                                    winner = 0
                                    if match.score.teamHome.id == s_team.id:
                                        if match.score.regular_home > match.score.regular_away:
                                            # s_team jest zwyciezcą
                                            winner = 1
                                        else:
                                            # team jest zwyciezcą
                                            winner = 2
                                    else:
                                        if match.score.regular_away > match.score.regular_home:
                                            # s_team jest zwyciezcą
                                            winner = 1
                                        else:
                                            # team jest zwyciezcą
                                            winner = 2
                                    if winner == 1:
                                        continue
                                    elif winner == 2:
                                        sorted_teams.insert(ind, team)
                                        breaked = True
                                        break
                if not breaked:
                    sorted_teams.append(team)
        pos = 1
        for team in sorted_teams:
            team.position = pos
            team.save()
            pos = pos + 1
