from django.db import models

class PermMeta(object):
	""" Bazowa grupa uprawnień """
	default_permissions = ('add', 'change', 'delete', 'view')

class PermMetaView(object):
	""" Bazowa grupa uprawnień """
	default_permissions = ('view')


class NoPermMeta(object):
	""" Bazowa grupa uprawnień """
	default_permissions = ()


class BaseModel(models.Model):
	
	def getPrevObject(self):
		if self.pk:
			return type(self).objects.get(pk=self.pk)
		else:
			return None
	
	class Meta:
		abstract = True
