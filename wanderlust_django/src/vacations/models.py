from django.db import models

class CountriesModel(models.Model):
    countryID = models.AutoField(primary_key=True)
    countryName = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.countryName or "missing country name"

    class Meta:
        managed = True
        db_table = 'countries'


class VacationsModel(models.Model):
    vacationID = models.AutoField(primary_key=True)
    description = models.TextField()
    
    # Specify db_column to align with the actual column name in your database
    countryName = models.ForeignKey(
        CountriesModel, on_delete=models.SET_NULL, null=True, related_name="vacations", db_column='countryID'
    )
    
    startDate = models.DateField(blank=True, null=True)
    endDate = models.DateField(blank=True, null=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    vacationImage = models.ImageField(upload_to='vacationImage/', blank=True, null=True)

    class Meta:
        db_table = 'vacations'


class LikesModel(models.Model):
    likesID = models.AutoField(primary_key=True)
    userID = models.ForeignKey('users.UserModel', on_delete=models.CASCADE, related_name='likes', db_column='userID')
    
    vacationID = models.ForeignKey(VacationsModel, on_delete=models.CASCADE, related_name='likes', db_column='vacationID') 

    class Meta:
        managed = True
        db_table = 'likes'