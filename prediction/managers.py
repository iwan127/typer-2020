from django.db import models


class UserPointsManager(models.Manager):

    def get_queryset(self):
        return super(UserPointsManager, self).get_queryset().order_by('-points')


class ExtraQuestionsUserAnswersManager(models.Manager):

    def get_queryset(self):
        return super(ExtraQuestionsUserAnswersManager, self).get_queryset().order_by('user_id', 'question_id')
