# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0004_imageslideshow'),
    ]

    operations = [
        migrations.AddField(
            model_name='imageslideshow',
            name='attribution',
            field=models.CharField(default='Reese Levine', max_length=200),
            preserve_default=False,
        ),
    ]
