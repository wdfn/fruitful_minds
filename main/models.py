import datetime

from django.db import models
from django.utils import timezone

# Create your models here.
class MessageBar(models.Model):

    text = models.TextField()

    def __unicode__(self):
        return self.text
