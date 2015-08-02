# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone
import model_utils.fields


class Migration(migrations.Migration):

    replaces = [('blog', '0001_initial')]

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('created', model_utils.fields.AutoCreatedField(editable=False, verbose_name='created', default=django.utils.timezone.now)),
                ('modified', model_utils.fields.AutoLastModifiedField(editable=False, verbose_name='modified', default=django.utils.timezone.now)),
                ('title', models.CharField(max_length=200)),
                ('body', models.TextField()),
                ('body_html', models.TextField(editable=False, blank=True, null=True)),
                ('slug', models.SlugField(blank=True, max_length=500)),
                ('views', models.IntegerField(default=0)),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
