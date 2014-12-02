import datetime

from django.db import models
from django.utils import timezone

# Create your models here.
class MessageBar(models.Model):

    text = models.TextField()
    pub_date = models.DateTimeField("date published", auto_now=True)

    def __unicode__(self):
        return self.text

class ImageSlideshow(models.Model):

    photo = models.ImageField(upload_to='portal')
    quote = models.TextField()
    attribution = models.CharField(max_length=200)

    def __unicode__(self):
        return self.quote

