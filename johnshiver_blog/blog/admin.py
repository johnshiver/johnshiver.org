from django.contrib import admin
from django.db import models

from .models import Post

from pagedown.widgets import AdminPagedownWidget


class PostAdmin(admin.ModelAdmin):

    list_display = ('title', 'created', 'views')

    formfield_overrides = {
        models.TextField: {'widget': AdminPagedownWidget},
    }


admin.site.register(Post, PostAdmin)
