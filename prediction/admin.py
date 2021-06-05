from django.contrib import admin

from .models import Prediction, Points, UserPoints, ExtraQuestions, ExtraQuestionsUserAnswers

admin.site.register(Points)
admin.site.register(Prediction)
admin.site.register(UserPoints)
admin.site.register(ExtraQuestions)
admin.site.register(ExtraQuestionsUserAnswers)
