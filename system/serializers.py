from rest_framework import serializers
from django.utils.translation import ugettext_lazy as _
from . import models as sys_m
from rest_framework.exceptions import ValidationError


class UserBaseSerializer(serializers.HyperlinkedModelSerializer):
#     partial = True
    
    class Meta:
        model = sys_m.SystemUser
        fields = ('id', 'username', 'avatar', 'nickname', )
        extra_kwargs = {'nickname': {'required': True}}


class UserDetailsSerializer(UserBaseSerializer):
    
    class Meta(UserBaseSerializer.Meta):
        fields = UserBaseSerializer.Meta.fields + ('email', )
        extra_kwargs = {'email': {'required': True}}


class UserSerializer(UserDetailsSerializer):
    
    class Meta(UserDetailsSerializer.Meta):
        fields = UserDetailsSerializer.Meta.fields + ('password', )

    def add_error(self, field, message):
        self._validated_data = {}
        if not self._errors:
            self._errors = {}
        self._errors[field] = message

    def is_valid(self, raise_exception=False):
        super(UserSerializer, self).is_valid(raise_exception)
        password = self.initial_data.get('password')
        password2 = self.initial_data.get('password2')
        
        if not password:
            self.add_error('password', _('Podaj hasło'))
        
        if not password2:
            self.add_error('password2', _('Podaj potwierdzenie hasła'))
        
        if password and password2 and password != password2:
            self.add_error('password2', _('Hasła są różne'))

        if self._errors and raise_exception:
            raise ValidationError(self.errors)

        return not bool(self._errors)
    
    def create(self, validated_data):
        user = sys_m.SystemUser.objects.create(
            username=validated_data['username'],
            email=validated_data['email']
        )
 
        user.set_password(validated_data['password'])
        user.save()
 
        return user
