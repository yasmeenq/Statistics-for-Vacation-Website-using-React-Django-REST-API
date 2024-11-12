from django.contrib import admin
from .models import VacationsModel, CountriesModel, LikesModel

# Register your models here.
@admin.register(VacationsModel)
class VacationAdmin(admin.ModelAdmin):
    list_display = ('vacationID', 'description', 'startDate', 'endDate', 'price', 'countryName')  
    search_fields = ('description', 'countryName__countryName')  
    list_filter = ('countryName', 'startDate', 'endDate')  

@admin.register(CountriesModel)
class CountryAdmin(admin.ModelAdmin):
    list_display = ('countryID', 'countryName')
    search_fields = ('countryName',)

@admin.register(LikesModel)
class LikeAdmin(admin.ModelAdmin):
    list_display = ('likesID', 'userID', 'vacationID')
    search_fields = ('userID__email',) 
