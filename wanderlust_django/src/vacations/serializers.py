from rest_framework import serializers
from .models import VacationsModel, CountriesModel, LikesModel
from rest_framework import serializers
from .models import VacationsModel, CountriesModel, LikesModel

from rest_framework import serializers
from .models import VacationsModel, CountriesModel, LikesModel

# Serializer for CountriesModel
class CountriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = CountriesModel
        fields = ['countryID', 'countryName']

# Serializer for VacationsModel
class VacationsSerializer(serializers.ModelSerializer):
    country = CountriesSerializer()  # Nested serializer to include country data

    class Meta:
        model = VacationsModel
        fields = [
            'vacationID', 'description', 'country', 'startDate',
            'endDate', 'price', 'vacationImage'
        ]

# Serializer for LikesModel
class LikesSerializer(serializers.ModelSerializer):
    class Meta:
        model = LikesModel
        fields = ['likesID', 'userID', 'vacationID']
