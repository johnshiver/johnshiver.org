from django.db import models
from django.template.defaultfilters import slugify

from model_utils.models import TimeStampedModel


class Post(TimeStampedModel):
    title = models.CharField(max_length=200)
    content = models.TextField()
    slug = models.SlugField(max_length=500)


def save(self):
    if not self.pk:
        # this code should only happen
        # if object not in db yet
        # only want it to execute once
        self.slug = slugify(self.title)
    super().save()
