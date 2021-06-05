from django.db import models
from django.db.models import F
from django.utils.translation import ugettext_lazy as _

from utils import models as utils_models
from prediction import models as pre_m
from django.utils import timezone
from datetime import timedelta


class Score(utils_models.BaseModel):
    WINNER_DRAW = 0
    WINNER_HOME = 1
    WINNER_AWAY = 2
    
    MATCH_WINNER = (
        (WINNER_HOME, _('Gospodarze')),
        (WINNER_AWAY, _('Goście')),
        (WINNER_DRAW, _('Remis'))
    )
    regular = models.CharField(verbose_name=_('Wynik w regulaminowym czasie gry'), max_length=5)
    et = models.CharField(verbose_name=_('Wynik w dogrywce'), null=True, blank=True, max_length=5)
    penalty = models.CharField(verbose_name=_('Wynik w rzutach karnych'), null=True, blank=True, max_length=5)
    regular_home = models.SmallIntegerField(verbose_name=_('Gole gospodarzy w regulaminowym czasie gry'))
    regular_away = models.SmallIntegerField(verbose_name=_('Gole gości w regulaminowym czasie gry'))
    et_home = models.SmallIntegerField(verbose_name=_('Gole gospodarzy w dogrywce'), null=True, blank=True)
    et_away = models.SmallIntegerField(verbose_name=_('Gole gości w dogrywce'), null=True, blank=True)
    penalty_home = models.SmallIntegerField(verbose_name=_('Gole gospodarzy w rzutach karnych'), null=True, blank=True)
    penalty_away = models.SmallIntegerField(verbose_name=_('Gole goście w rzutach karnych'), null=True, blank=True)
    winner = models.SmallIntegerField(verbose_name=_('Zwycięzca'), choices=MATCH_WINNER, null=True, blank=True)

    def __str__(self):
        return self.regular

    class Meta(utils_models.PermMeta):
        abstract = False
        verbose_name = _('Wynik')
        verbose_name_plural = _('Wyniki')


class Match(utils_models.BaseModel):
    teamHome = models.ForeignKey('team.Team', related_name='matches_home', verbose_name=_('Gospodarze'), on_delete=models.CASCADE)
    teamAway = models.ForeignKey('team.Team', related_name='matches_away', verbose_name=_('Goście'), on_delete=models.CASCADE)
    score = models.OneToOneField('Score', verbose_name=_('Wynik'), related_name='match', null=True, blank=True, on_delete=models.SET_NULL)
    datetime = models.DateTimeField(verbose_name=_('Data i godzina'))
    stadium = models.ForeignKey('places.Stadium', verbose_name=_('Stadion'), on_delete=models.CASCADE)
    round = models.ForeignKey('round.Round', verbose_name=_('Runda'), on_delete=models.CASCADE)
    group = models.ForeignKey('round.Group', related_name='matches', verbose_name=_('Grupa'), on_delete=models.CASCADE, null=True, blank=True)
    prediction_enabled = models.BooleanField(verbose_name=_('Typowanie włączone'), default=True)

    class Meta(utils_models.PermMeta):
        abstract = False
        verbose_name = _('Mecz')
        verbose_name_plural = _('Mecze')
    
    def __init__(self, *args, **kwargs):
        super(Match, self).__init__(*args, **kwargs)
        self.check_prediction_enabled()

    def __str__(self):
        roundStr = self.round
        if self.group is not None:
            roundStr = '%s | %s' % (roundStr, self.group)
        return '%s - %s, %s (%s)' % (self.teamHome, self.teamAway, self.datetime, roundStr)
    
    def save(self, *args, **kwargs):
        skip_calculate_points = False
        skip_calculate_table = False
        reset_mode = False
        if kwargs.get('skip_calculate_points'):
            skip_calculate_points = True
            del kwargs['skip_calculate_points']
        if kwargs.get('reset_mode'):
            reset_mode = True
            skip_calculate_table = True
            del kwargs['reset_mode']
        if not skip_calculate_points:
            prev = self.getPrevObject()
            if self.group is not None and not skip_calculate_table:
                self.group.calculate_table()
        super(Match, self).save(*args, **kwargs)
        if not skip_calculate_points:
            if prev is not None:
                if prev.score is not None and self.score is not None:
                    if prev.score.regular != self.score.regular or prev.score.et != self.score.et or prev.score.penalty != self.score.penalty or reset_mode:
                        self.calculate_points(False, reset_mode)
                        if self.group is not None and not skip_calculate_table:
                            self.group.calculate_table()
                elif prev.score is None and self.score is not None:
                    self.calculate_points(False, reset_mode)
                    if self.group is not None and not skip_calculate_table:
                        self.group.calculate_table()
                elif prev.score is not None and self.score is None:
                    self.calculate_points(True, reset_mode)
                    if self.group is not None and not skip_calculate_table:
                        self.group.calculate_table()
            else:
                self.calculate_points(False, reset_mode)
                if self.group is not None and not skip_calculate_table:
                    self.group.calculate_table()

    @property
    def get_points_rules(self):
        """pobranie wszystkich punktów wszystkich zasad."""
        if not hasattr(self, '_points_rules'):
            self._points_rules = list(pre_m.Points.objects.all())
        return self._points_rules

    def get_points_by_rule(self, rule):
        """Pobranie liczby punktów dla danej zasady."""
        points_for_rule = [pr for pr in self.get_points_rules if pr.rule == rule]
        if len(points_for_rule) > 0:
            return points_for_rule[0]
        return None

    def calculate_points(self, zero_points=False, reset_mode=False):
        """Dodanie użytkonikom punktów za typy. Jeśli 'zero_points' jest ustawione na True,
        punkty wszystkich użytkowników zostaną wyzerowane. Jeśli 'reset_mode' jest ustawione na True,
        punkty za ten typ zostaną odjęte od wszystkich zdobytych punktów kazdego z uzytkowników, a takze
        punkty za ten typ zostają wyzerowane.
        """
        # print ('--------', reset_mode)
        match_predictions = self.predictions.all()
        if zero_points:
            match_predictions.update(points=0)
        elif self.score_id is not None:
            predictions_used = []
            
            # punkty za dokładny wynik
            points_score = self.get_points_by_rule(pre_m.Points.POINTS_EXACT_SCORE)
#             if points is not None:
#                 qs = match_predictions.filter(goals_home=self.score.regular_home, goals_away=self.score.regular_away)
#                 qs.update(points=points.points)
#                 predictions_used = list(qs.values_list('id', flat=True))

            # pobranie punktów dla poszczególnych zasad(ustawianych z poziomu panelu admina)
            result = self.score.regular_home - self.score.regular_away
            points_result = self.get_points_by_rule(pre_m.Points.POINTS_RESULT)
            score_diff = result
            score_diff_abs = abs(score_diff)
            points_diff = self.get_points_by_rule(pre_m.Points.POINTS_GOALS_DIFFERENCE)
            points_goals_team = self.get_points_by_rule(pre_m.Points.POINTS_EXACT_GOALS_TEAM)
            
            predictions = match_predictions.exclude(id__in=predictions_used)
            for pr in predictions:
                points = 0
                points_diff_abs = 0
                n_exact_score = 0
                n_correct_result = 0
                
                # punkty za dokładny wynik
                if points_score is not None:
                    if pr.goals_home == self.score.regular_home and pr.goals_away == self.score.regular_away:
                        points = points_score.points
                        points_diff_abs = points_score.points
                        n_exact_score = 1
                
                # pozostałe punkty
                if points == 0:
                    # punkty za poprawną różnicę bramek
                    if points_diff is not None:
                        diff = pr.goals_home - pr.goals_away
                        diff_abs = abs(diff)
                        if diff == score_diff:
                            points = points + points_diff.points
                        if diff_abs == score_diff_abs:
                            points_diff_abs = points_diff_abs + points_diff.points
                    
                    # punkty za poprawny rezultat (1X2)
                    if points_result is not None:
                        pr_result = pr.goals_home - pr.goals_away
                        if (pr_result > 0 and result > 0) or (pr_result < 0 and result < 0) or (pr_result == 0 and result == 0):
                            points = points + points_result.points
                            points_diff_abs = points_diff_abs + points_result.points
                            n_correct_result = 1
                    
                    # punkty za liczbę bramek strzelonych przez drużynę
                    if points_goals_team is not None:
                        pr_result = pr.goals_home - pr.goals_away
                        if (pr.goals_home == self.score.regular_home) or (pr.goals_away == self.score.regular_away):
                            points = points + points_goals_team.points
                            points_diff_abs = points_diff_abs + points_goals_team.points
                pr.points = points
                if reset_mode and not pr.fix_goals_diff:
                    points = points - points_diff_abs
                    pr.fix_goals_diff = True
                pr.save()
                
                # zapisanie punktów w tabeli sumującej punkty użytkownika
                try:
                    up = pre_m.UserPoints.objects.get(user_id=pr.user.id)
                except pre_m.UserPoints.DoesNotExist:
                    up = pre_m.UserPoints()
                    up.user = pr.user
                    up.points = 0
                    up.n_exact_scores = 0
                    up.n_results = 0
                up.points = up.points + points
                up.n_exact_scores = up.n_exact_scores + n_exact_score
                up.n_results = up.n_results + n_correct_result
                up.save()
    
    def check_prediction_enabled(self):
        """Sprawdzenie, czy mecz można typować. Można wtedy, gdy ma ustawioną flagę prediction_enabled na True
        i nie minął jeszcze czas zakończenia typowania (zależny od godziny rozpoczęcia meczu). Jeśli obiekt nie ma
        jeszcze ustawionego prediction_enabled na False, a czas typowania minął, to flaga ta jest ustawiana na False,
        a obiekt jest zapisywany.
        """
        if self.prediction_enabled and self.datetime:
            current_dt = timezone.now()
            close_predicting_dt = self.datetime - timedelta(minutes=5)
            if close_predicting_dt > current_dt:
                return True;
            else:
                self.prediction_enabled = False
                self.predictions.all().update(editable=False)
                self.save(skip_calculate_points=True)
        return False
