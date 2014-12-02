# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0003_auto_20141201_1025'),
    ]

    operations = [
        migrations.CreateModel(
            name='ImageSlideshow',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('photo', models.ImageField(upload_to=b'front_page')),
                ('quote', models.TextField()),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
