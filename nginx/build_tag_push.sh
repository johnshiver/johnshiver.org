#!/bin/bash
docker build -t blog_nginx .
docker tag blog_nginx localhost:5000/blog_nginx:latest
docker push localhost:5000/blog_nginx:latest
