# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0005_imageslideshow_attribution'),
    ]

    operations = [
        migrations.AlterField(
            model_name='imageslideshow',
            name='photo',
            field=models.ImageField(upload_to=b'portal'),
        ),
    ]
