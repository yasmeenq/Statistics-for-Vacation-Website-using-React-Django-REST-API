from rest_framework import serializers
from .models import UserModel, RoleModel



class RolesSerializer(serializers.ModelSerializer):
    class Meta:
        model = RoleModel
        fields = ['id', 'role']


class UserSerializer(serializers.ModelSerializer):
    role = RolesSerializer()

    class Meta:
        model = UserModel
        fields = ['id', 'first_name', 'last_name', 'email', 'password', 'role']
