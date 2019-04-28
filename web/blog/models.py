from django.db import models
from django.template.defaultfilters import slugify

from model_utils.models import TimeStampedModel
from markdown import markdown


class Post(TimeStampedModel):
    title = models.CharField(max_length=200)
    body = models.TextField()
    body_html = models.TextField(editable=False, blank=True, null=True)
    slug = models.SlugField(max_length=500, blank=True)
    views = models.IntegerField(default=0)

    def __str__(self):
        return self.slug

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        self.body_html = markdown(self.body, ['codehilite'])
        super().save(*args, **kwargs)
