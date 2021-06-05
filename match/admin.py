from django.contrib import admin

from .models import Match, Score


@admin.register(Match)
class AdminMatch(admin.ModelAdmin):
     
    list_display = ('teams', 'datetime', 'round', 'group')
    list_filter = ('datetime', 'round', 'group')
    search_fields = ('teamHome', 'teamAway')

    def teams(self, obj):
        return ('%s - %s' % (obj.teamHome, obj.teamAway))
    teams.short_description = 'Drużyny'


@admin.register(Score)
class AdminScore(admin.ModelAdmin):
     
    list_display = ('regular', 'match')

#     def teams(self, obj):
#         return ('%s - %s' % (obj.teamHome, obj.teamAway))
#     teams.short_description = 'Drużyny'
