# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import model_utils.fields
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('created', model_utils.fields.AutoCreatedField(editable=False, verbose_name='created', default=django.utils.timezone.now)),
                ('modified', model_utils.fields.AutoLastModifiedField(editable=False, verbose_name='modified', default=django.utils.timezone.now)),
                ('title', models.CharField(max_length=200)),
                ('body', models.TextField()),
                ('body_html', models.TextField(editable=False, blank=True, null=True)),
                ('slug', models.SlugField(max_length=500, blank=True)),
                ('views', models.IntegerField(default=0)),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
