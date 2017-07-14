from django.core.cache import cache
from django.shortcuts import render, get_object_or_404
from django.views.generic import View, ListView, DetailView
from utils import SocialMedia

from .models import Post


class MainPageView(View):
    """
    Displays
     - five most recent posts
     - five most recent grams
     - five most recent tweets
    """

    def get(self, request, *args, **kwargs):
        posts = cache.get('all-posts')
        if not posts:
            posts = Post.objects.all().order_by('-created')[:5]
            cache.set('all-posts', posts, 300)

        media_tools = SocialMedia()
        # TODO: for some reason instagram no longer works, need to fix
        # grams = media_tools.grams
        grams = None
        tweets = media_tools.tweets
        commits = media_tools.commits
        print(commits)

        return render(request,
                      "main.html",
                      {"posts": posts,
                       "commits": commits[:5],
                       "grams": grams,
                       "tweets": tweets[:5],})


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

class MyToolsView(DetailView):
    """
    Single page view for the tools post I made.
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

    def get_object(self):
        return get_object_or_404(Post, pk=5)
