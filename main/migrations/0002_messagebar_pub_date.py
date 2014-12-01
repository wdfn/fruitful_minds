# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='messagebar',
            name='pub_date',
            field=models.DateTimeField(default=datetime.date(2014, 12, 1), auto_now=True),
            preserve_default=False,
        ),
    ]
