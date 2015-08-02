from django.shortcuts import render
from django.views.generic import View, ListView, DetailView

from .models import Post


class MainPageView(View):
    """
    View for Main page

    Displays
     - five most recent posts
     - five most recent grams
     - five most recent tweets
    """

    def get(self, request):
        pass


class AllBlogPostsView(ListView):
    """
    View that returns list of all blog posts
    """
    template_name = "post_list.html"
    context_object_name = "posts"
    model = Post
    fields = ('title', 'content', 'created', 'author')


class BlogPostView(DetailView):
    """
    View that displays individual blog post
    """
    template_name = "single_post.html"
    context_object_name = "post"
    model = Post
    fields = ('title', 'content', 'created', 'author')
