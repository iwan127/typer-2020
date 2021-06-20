from django.db import models
from django.utils.translation import ugettext_lazy as _

from utils import models as utils_models
from . import managers as pre_mg
from django.template.defaultfilters import striptags
from django.utils import timezone

from round import models as rou_m


class Prediction(utils_models.BaseModel):
    user = models.ForeignKey('system.SystemUser', verbose_name=_('Użytkownik'), related_name='predictions', on_delete=models.CASCADE)
    match = models.ForeignKey('match.Match', verbose_name=_('Mecz'),related_name='predictions', on_delete=models.CASCADE)
    goals_home = models.SmallIntegerField(verbose_name=_('Gole gospodarzy'))
    goals_away = models.SmallIntegerField(verbose_name=_('Gole gości'))
    points = models.SmallIntegerField(verbose_name=_('Punkty'), null=True, blank=True)
    editable = models.BooleanField(verbose_name=_('Można edytować?'), default=True)
    fix_goals_diff = models.BooleanField(verbose_name=_('Czy typ był poprawiony: błąd z różnicą bramek'), default=False, blank=True)
    
    def __init__(self, *args, **kwargs):
        super(Prediction, self).__init__(*args, **kwargs)
        # self.check_editable();

    def __str__(self):
        return '%s | %s' % (self.match, self.user.get_full_name())
    

    class Meta(utils_models.PermMeta):
        abstract = False
        verbose_name = _('Typ')
        verbose_name_plural = _('Typy')
        unique_together = ('user', 'match')

    
    def check_editable(self):
        """Sprawdzenie, czy typ jest edytowalny. Jest edytowalny wtedy, gdy ma ustawioną flagę editable na True
        i mecz ma włączone typowanie.
        """
        if self.id and self.editable and self.match:
            if self.match.check_prediction_enabled():
                return True;
            else:
                self.editable = False
                self.save()
        return False


class Points(utils_models.BaseModel):
    POINTS_EXACT_SCORE = 1
    POINTS_RESULT = 2
    POINTS_GOALS_DIFFERENCE = 3
    POINTS_EXACT_GOALS_TEAM = 4
    POINTS_RULES = (
        (POINTS_EXACT_SCORE, _('Dokładny wynik')),
        (POINTS_RESULT, _('Rezultat')),
        (POINTS_GOALS_DIFFERENCE, _('Różnica bramek')),
        (POINTS_EXACT_GOALS_TEAM, _('Bramki drużyny')),
    )
    rule = models.SmallIntegerField(verbose_name=_('Rodzaj punktów'), choices=POINTS_RULES)
    points = models.SmallIntegerField(verbose_name=_('Liczba punktów'))

    def __str__(self):
        return self.get_rule_display()
    
    class Meta(utils_models.PermMeta):
        abstract = False
        verbose_name = _('Punkty')
        verbose_name_plural = _('Punkty')
        

class UserPoints(utils_models.BaseModel):
    objects = pre_mg.UserPointsManager()

    user = models.ForeignKey('system.SystemUser', verbose_name=_('Użytkownik'), related_name='points', on_delete=models.CASCADE)
    points = models.SmallIntegerField(verbose_name=_('Punkty'))
    n_exact_scores = models.SmallIntegerField(verbose_name=_('Liczba wytypowanych dokładnych wyników'), default=0)
    n_results = models.SmallIntegerField(verbose_name=_('Liczba wytypowanych poprawnych rezultatów'), default=0)
    n_extra_questions = models.SmallIntegerField(verbose_name=_('Punkty za pytania dodatkowe'), default=0)
    n_yellow_cards = models.SmallIntegerField(verbose_name=_('Liczba żółtych kartek'), default=0)

    def __str__(self):
        return '%s - %s pkt' % (self.user.nickname if self.user.nickname else self.user.username, self.points)

    class Meta(utils_models.PermMeta):
        abstract = False
        verbose_name = _('Punkty użytkownika')
        verbose_name_plural = _('Punkty użytkownika')


class ExtraQuestions(utils_models.BaseModel):
    # TODO: zrobić odpowiedzi jako osobny model i zaznaczanie poprawnej odpowiedzi (w panelu admina)
    # jako select z opcjami zrobionymi z tych odpowiedzi
    AT_TEXT = 1
    AT_SELECT_TEAM = 2
    AT_SELECT_2_TEAMS = 3
    AT_SELECT_2_TEAMS_GROUP = 4
    AT_SELECT_ROUND = 5
    ANSWER_TYPES = (
        (AT_TEXT, _('Tekstowa')),
        (AT_SELECT_TEAM, _('Jedna drużyna')),
        (AT_SELECT_2_TEAMS, _('Dwie drużyny')),
        (AT_SELECT_2_TEAMS_GROUP, _('Dwie drużyny w grupie')),
        (AT_SELECT_ROUND, _('Runda')),
    )
    text = models.TextField(verbose_name=_('Treść pytania'))
    answer_type = models.SmallIntegerField(verbose_name=_('Rodzaj odpowiedzi'), choices=ANSWER_TYPES)
    points = models.SmallIntegerField(verbose_name=_('Liczba punktów do zdobycia'))
    half_points = models.SmallIntegerField(verbose_name=_('Liczba punktów do zdobycia za częściowo poprawną odpowiedź'))
    correct_answer = models.CharField(verbose_name=_('Poprawna odpowiedź'), null=True, blank=True, max_length=64)
    answer_enabled = models.BooleanField(verbose_name=_('Można udzielać odpowiedzi?'), default=True)
    close_datetime = models.DateTimeField(verbose_name=_('Data i godzina zamknięcia pytania'), null=True, blank=False)
    group = models.ForeignKey('round.Group', verbose_name=_('Grupa, któej dotyczy pytanie'), null=True, blank=True, on_delete=models.CASCADE)

    def __str__(self):
        text = str(_('[Treść pytania]'))
        if self.text:
            text = striptags(self.text)
        return (text[:40] + '..') if len(text) > 40 else text
    
    class Meta(utils_models.PermMeta):
        abstract = False
        verbose_name = _('Pytanie dodatkowe')
        verbose_name_plural = _('Pytania dodatkowe')
    
    def __init__(self, *args, **kwargs):
        super(ExtraQuestions, self).__init__(*args, **kwargs)
        self.check_answering_enabled()
    
    def save(self, *args, **kwargs):
        skip_calculate_points = False
        if kwargs.get('skip_calculate_points'):
            skip_calculate_points = True
            del kwargs['skip_calculate_points']
        if not skip_calculate_points:
            prev = self.getPrevObject()
        super(ExtraQuestions, self).save(*args, **kwargs)
        if not skip_calculate_points:
            if prev is not None:
                if prev.correct_answer != self.correct_answer and not self.answer_enabled:
                    self.calculate_points()

    def check_answering_enabled(self):
        """Sprawdzenie, czy można odpowiadać na pytanie. Można wtedy, gdy ma ustawioną flagę answer_enabled na True
        i nie minął jeszcze czas zakończenia odpowiadania. Jeśli obiekt nie ma jeszcze ustawionego answer_enabled
        na False, a czas typowania minął, to flaga ta jest ustawiana na False, a obiekt jest zapisywany.
        """
        if self.answer_enabled and self.close_datetime:
            current_dt = timezone.now()
            if self.close_datetime > current_dt:
                return True;
            else:
                self.answer_enabled = False
                self.user_answers.all().update(editable=False)
                self.save(skip_calculate_points=True)
        return False

    def calculate_points(self):
        """Dodanie użytkonikom punktów za dodatkowe pytania.
        """
        correct_answer = self.correct_answer
        if correct_answer:
            for u_ans in self.user_answers.all():
                u_pts = 0
                if u_ans.answer_integer or u_ans.answer_integer == 0:
                    if self.answer_type == self.AT_SELECT_2_TEAMS or self.answer_type == self.AT_SELECT_2_TEAMS_GROUP:
                        correct_answers = correct_answer.split(',')
                        u_anses = str(u_ans.answer_integer).split(',')
                        if len(correct_answers) == 2 and len(u_anses) == 2:
                            correct1 = 0
                            correct2 = 0
                            if correct_answers[0] == u_anses[0]:
                                correct1 += 1
                            if correct_answers[1] == u_anses[1]:
                                correct1 += 1
                            
                            if correct_answers[1] == u_anses[0]:
                                correct2 += 1
                            if correct_answers[0] == u_anses[1]:
                                correct2 += 1
                            
                            if correct1 == 2 or correct2 == 2:
                                u_pts = self.points
                            elif correct1 == 1 or correct2 == 1:
                                u_pts = self.half_points
                    else:
                        u_ans_str = str(u_ans.answer_integer)
                        if correct_answer == u_ans_str:
                            u_pts = self.points
                u_ans.points = u_pts
                u_ans.save()
                
                # zapisanie punktów w tabeli sumującej punkty użytkownika
                (up, created) = UserPoints.objects.get_or_create(user_id=u_ans.user.id, defaults={'points': 0})
                # up.points = up.points + u_pts
                up.n_extra_questions = up.n_extra_questions + u_pts
                up.save()


class ExtraQuestionsUserAnswers(utils_models.BaseModel):
    objects = pre_mg.ExtraQuestionsUserAnswersManager()

    user = models.ForeignKey('system.SystemUser', verbose_name=_('Użytkownik'), related_name='extra_questions_answers', on_delete=models.CASCADE)
    question = models.ForeignKey(ExtraQuestions, verbose_name=_('Pytanie'), related_name='user_answers', on_delete=models.CASCADE)
    answer_text = models.TextField(verbose_name=_('Odpowiedź tekstowa'))
    answer_integer = models.TextField(verbose_name=_('Odpowiedź numeryczna'))
    editable = models.BooleanField(verbose_name=_('Można edytować?'), default=True)
    points = models.SmallIntegerField(verbose_name=_('Punkty'), null=True, blank=True)

    def __str__(self):
        return self.user.get_full_name() + ' | ' + self.question.__str__()

    class Meta(utils_models.PermMeta):
        abstract = False
        verbose_name = _('Odpowiedź użytkowników')
        verbose_name_plural = _('Odpowiedzi użytkowników')
