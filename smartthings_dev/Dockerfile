###################################
#
# SmartThingsWebAPP Docker Container
# @author Nate Wood
#
###################################

# Pull base image.
FROM python:2.7.13
ENV PYTHONUNBUFFERED 1

# Setup linkages to code repositories and add to image

ENV APP_ROOT /var/www/backend
RUN mkdir /var/www;
RUN mkdir /var/www/backend

WORKDIR ${APP_ROOT}

#Python packages
RUN pip install Django==1.11
RUN pip install djangorestframework
RUN pip install django-templated-email
RUN pip install markdown
RUN pip install django-filter
RUN pip install psycopg2
RUN pip install requests
RUN pip install bleach
RUN pip install gunicorn==19.6.0
RUN pip install django-templated-email
RUN pip install djangorestframework-jsonapi
