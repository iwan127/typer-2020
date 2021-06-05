from rest_framework import permissions


class OwnerPermission(permissions.BasePermission):

    def has_object_permission(self, request, view, obj):
        return request.user.is_authenticated and obj.user == request.user


class UserModifyPermission(permissions.BasePermission):

    def has_object_permission(self, request, view, obj):
        return request.user.is_authenticated and obj == request.user


class AuthPermission(permissions.BasePermission):
    
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.method in permissions.SAFE_METHODS


class PredictionsPermission(permissions.BasePermission):

    def has_object_permission(self, request, view, obj):
        return request.user.is_authenticated() and (obj.user == request.user or request.method in permissions.SAFE_METHODS)
