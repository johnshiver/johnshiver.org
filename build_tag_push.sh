#!/bin/bash
docker build -t blog_app .
docker tag blog_app localhost:5000/blog_app:latest
docker push localhost:5000/blog_app:latest
