from django.db import models

# Create your models here.
class Enterprise(models.Model):
    name = models.CharField(max_length=100)  
    lat = models.DecimalField(decimal_places=4, max_digits=10)
    lon = models.DecimalField(decimal_places=4, max_digits=10)
    webhook = models.URLField()
    class Meta:  
        db_table = "enterprise"