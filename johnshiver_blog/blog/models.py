from django.db import models
from django.template.defaultfilters import slugify

from model_utils.models import TimeStampedModel
from django_markdown.models import MarkdownField
from authtools.models import User


class Post(TimeStampedModel):
    title = models.CharField(max_length=200)
    content = MarkdownField()
    slug = models.SlugField(max_length=500, blank=True)
    views = models.IntegerField(default=0)

    def __unicode__(self):
        return self.title

    def save(self, *args, **kwargs):
        if not self.pk:
            # this code should only happen
            # if object not in db yet
            # only want it to execute once
            self.slug = slugify(self.title)
        super().save(*args, **kwargs)
