from django.conf.urls import patterns, url

from .views import PostCollection


urlpatterns = patterns(
    url(r'blogposts/$',
        PostCollection.as_view(),
        name='posts')
)