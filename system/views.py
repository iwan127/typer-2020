# from django.shortcuts import render

from rest_framework import viewsets, status, generics, permissions
# from rest_framework.response import Response
# from rest_framework.views import APIView
from rest_framework.response import Response

from . import models as sys_m
from . import serializers as sys_s
from . import permissions as sys_p
from rest_framework.parsers import MultiPartParser
from rest_auth.registration import views as reg_v
# from django.http.response import Http404


class UserViewSet(viewsets.ModelViewSet):
    queryset = sys_m.SystemUser.objects.all()
    serializer_class = sys_s.UserSerializer


class UserListView(generics.ListCreateAPIView):
    queryset = sys_m.SystemUser.objects.all()
    serializer_class = sys_s.UserSerializer


class CurrentUserInfoView(generics.RetrieveAPIView):
    queryset = sys_m.SystemUser.objects.all()
    serializer_class = sys_s.UserBaseSerializer
    permission_classes = (permissions.IsAuthenticated, )
    
    def get_object(self):
        self.kwargs['pk'] = self.request.user.id
        return super(CurrentUserInfoView, self).get_object()


class UserDetailsPreviewView(generics.RetrieveAPIView):
    queryset = sys_m.SystemUser.objects.all()
    serializer_class = sys_s.UserBaseSerializer
    permission_classes = (sys_p.AuthPermission, )


class UserDetailsView(generics.RetrieveUpdateDestroyAPIView):
    queryset = sys_m.SystemUser.objects.all()
    serializer_class = sys_s.UserDetailsSerializer
    permission_classes = (sys_p.UserModifyPermission, )
    parser_classes = (MultiPartParser, )
    
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)
    
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        ret = dict(serializer.data)
#         del ret['password']
        return Response(ret)

#     def get_serializer(self, *args, **kwargs):
#         kwargs['partial'] = True
#         return super(UserDetailsView, self).get_serializer(*args, **kwargs)


class RegisterView(reg_v.RegisterView):
    
    def post(self, request, *args, **kwargs):
        
        return super(RegisterView, self).post(request, *args, **kwargs)


# class UserListView(APIView):
# 
#     def get(self, request, format=None):
#         users = sys_m.SystemUser.objects.all()
#         serializer = sys_s.UserSerializer(users, many=True)
#         return Response(serializer.data)
# 
#     # można zakomentować metodę 'post' - wtedy nie będzie formularza dodawania użytkownika
#     def post(self, request, format=None):
#         serializer = sys_s.UserSerializer(data=request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return Response(serializer.data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# class UserDetailsView(APIView):
#     
#     def get_object(self, pk):
#         try:
#             return sys_m.SystemUser.objects.get(pk=pk)
#         except sys_m.SystemUser.DoesNotExist:
#             raise Http404
# 
#     def get(self, request, pk, format=None):
#         print ('pk', pk)
#         user = self.get_object(pk)
#         serializer = sys_s.UserSerializer(user)
#         return Response(serializer.data)
# 
#     def put(self, request, pk, format=None):
#         user = self.get_object(pk)
#         serializer = sys_s.UserSerializer(user, data=request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return Response(serializer.data, status=status.HTTP_200_OK)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
# 
#     def delete(self, request, pk, format=None):
#         user = self.get_object(pk)
#         user.delete()
#         return Response(status=status.HTTP_204_NO_CONTENT)
