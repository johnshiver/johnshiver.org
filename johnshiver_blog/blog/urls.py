from django.conf.urls import url

from .views import MainPageView, AllBlogPostsView, BlogPostView

urlpatterns = [

    url(r'all_posts/',
        AllBlogPostsView.as_view(),
        name='all-posts')
]
