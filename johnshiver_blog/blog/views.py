from django.shortcuts import render
from django.views.generic import View, ListView, DetailView
from django.core.cache import cache

from .models import Post
from utils.social_media_tools import SocialMedia


class MainPageView(View):
    """
    View for Main page

    Displays
     - five most recent posts
     - five most recent grams
     - five most recent tweets
    """

    def get(self, request, *args, **kwargs):
        posts = Post.objects.all().order_by('-created')[:5]
        media_tools = SocialMedia()

        grams = cache.get('grams')
        if not grams:
            grams = media_tools.get_grams
            cache.set('grams', grams, timeout=600)
        tweets = cache.get('tweets')
        if not tweets:
            tweets = media_tools.get_tweets
            cache.set('tweets', tweets, timeout=600)
        return render(request,
                      "main.html",
                      {"posts": posts,
                       "grams": grams,
                       "tweets": tweets, })


class AllBlogPostsView(ListView):
    """
    View that returns list of all blog posts
    """
    template_name = "post_list.html"
    context_object_name = "posts"
    model = Post
    ordering = '-created'
    fields = ('title', 'content', 'created', 'author')


class BlogPostView(DetailView):
    """
    View that displays individual blog post
    """
    template_name = "single_post.html"
    context_object_name = "post"
    model = Post
    fields = ('title', 'content', 'created', 'author')

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.views += 1
        self.object.save()
        context = self.get_context_data(object=self.object)
        return self.render_to_response(context)
