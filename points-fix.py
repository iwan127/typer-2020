from match.models import Match

matches = Match.objects.all()
for m in matches:
  m.save(reset_mode=True)

