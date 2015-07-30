from django.shortcuts import render

from rest_framework import mixins, generics

from .serializers import PostSerializer
from .models import Post


class PostCollection(mixins.ListModelMixin,
                     generics.GenericAPIView):
    """
    API View for All Blog Posts

    GET request: all Post objects

    ListModelMixin: provides list(request)
      - allows you to serializes a collection to JSON and return it

    GenericAPIView: provides core functionality
      - also provides browseable API
    """

    queryset = Post.objects.all()
    serializer_class = PostSerializer

    def get(self, request):
        return self.list(request)
