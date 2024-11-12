from django.shortcuts import render
from django.contrib.auth import authenticate
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework import status
from rest_framework_simplejwt.tokens import RefreshToken
from django.db.models import Count
from datetime import date
from vacations.models import VacationsModel, LikesModel, CountriesModel
from users.models import UserModel
import json
import logging
from django.views.decorators.csrf import csrf_exempt

logger = logging.getLogger(__name__)

# Route 1: Admin login
@api_view(["POST"])
def login_admin(request):
    email = request.data.get('email')
    password = request.data.get('password')
    user = authenticate(request, email=email, password=password)

    # Check if the user is authenticated 
    if user is not None:  
        refresh = RefreshToken.for_user(user)
        logger.info(f"Admin {user.email} logged in successfully.")
        return Response({
            "refresh": str(refresh),
            "access": str(refresh.access_token),
            "message": "Admin logged in successfully",
            "user": {"firstName": user.first_name, "lastName": user.last_name}
        }, status=status.HTTP_200_OK)
    else:
        logger.warning(f"Failed login attempt with email: {email}")
        return Response({"error": "Invalid credentials or not an admin"}, status=status.HTTP_403_FORBIDDEN)

# Route for logout
@csrf_exempt
@api_view(["POST"])
@permission_classes([IsAuthenticated])
def logout_user(request):
    try:
        return Response({"message": "Logged out successfully"}, status=status.HTTP_200_OK)
    except Exception as e:
        logger.error(f"Error during logout: {str(e)}")
        return Response({"error": "Logout failed"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#-----------------------------------------------------------------------------


# Route 3: Vacation statistics
@api_view(['GET'])
def vacation_stats(request):
    try:
        past_vacations = VacationsModel.objects.filter(endDate__lt=date.today()).count()
        ongoing_vacations = VacationsModel.objects.filter(startDate__lte=date.today(), endDate__gte=date.today()).count()
        future_vacations = VacationsModel.objects.filter(startDate__gt=date.today()).count()
        return Response({
            "past_vacations": past_vacations,
            "ongoing_vacations": ongoing_vacations,
            "future_vacations": future_vacations
        })
    except Exception as err:
        return Response({"error": str(err)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# Route 4: Total number of users
@api_view(['GET'])
def total_users(request):
    try:
        user_count = UserModel.objects.count()
        return Response({"total_users": user_count})
    except Exception as err:
        return Response({"error": str(err)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# Route 5: Total number of likes
@api_view(['GET'])
def total_likes(request):
    try:
        like_count = LikesModel.objects.count()
        return Response({"total_likes": like_count})
    except Exception as err:
        return Response({"error": str(err)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# Route 6: Likes per country
@api_view(['GET'])
def likes_per_country(request):
    try:
        # Count likes per country and filter out those with 0 likes
        country_likes = CountriesModel.objects.annotate(
            likes_count=Count('vacations__likes')
        ).filter(likes_count__gt=0).values('countryName', 'likes_count')

        # Prepare response
        result = [{'country': item['countryName'], 'likes': item['likes_count']} for item in country_likes]

        return Response(result, status=status.HTTP_200_OK)
    except Exception as err:
        return Response({"error": str(err)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)