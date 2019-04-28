FROM python:3.6

RUN apt-get update && \
    apt-get install -y && \
    pip3 install uwsgi

COPY ./app /opt/app

RUN pip3 install -r /opt/app/requirements.txt

EXPOSE 8010

CMD ["uwsgi", "--ini", "/opt/app/uwsgi.ini"]
