from django.conf.urls import url

from .views import MainPageView, AllBlogPostsView, BlogPostView

urlpatterns = [

    url(r'all_posts/',
        AllBlogPostsView.as_view(),
        name='all-posts'),
    url(r'^(?P<slug>[a-zA-Z0-9-]+)/$', BlogPostView.as_view(),
        name='blog_post')
]
