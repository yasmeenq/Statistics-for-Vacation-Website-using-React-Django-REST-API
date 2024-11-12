from django.urls import path
from . import views



urlpatterns = [
    # GET https://127.0.0.1/api/login
    path("login", views.login_admin, name="login_admin"),
    path("logout", views.logout_user, name="logout_user"),
    path("vacation-stats", views.vacation_stats, name="vacation_stats"),
    path("total-users", views.total_users, name="total_users"),
    path("total-likes", views.total_likes, name="total_likes"),
    path('likes-per-country', views.likes_per_country, name='likes-per-country'),
]
