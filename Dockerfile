###################################
#
# WiSTEM Award App Docker Container
# @author Matt Hale
#
###################################

# Pull base image.
FROM python:2.7.13
ENV PYTHONUNBUFFERED 1

# Setup linkages to code repositories and add to image
# ENV APP_USER wistem
ENV APP_ROOT /var/www/backend
ENV WEATHER_API_KEY ${WEATHER_API_KEY}
RUN mkdir /var/www;
RUN mkdir /var/www/backend
# RUN groupadd -r ${APP_USER} \
#    && useradd -r -m \
#    --home-dir ${APP_ROOT} \
#    -s /usr/sbin/nologin \
#    -g ${APP_USER} ${APP_USER}

WORKDIR ${APP_ROOT}

#Python packages
RUN pip install Django==1.11
RUN pip install djangorestframework
RUN pip install django-templated-email
RUN pip install markdown
RUN pip install django-filter
RUN pip install psycopg2-binary
RUN pip install requests
RUN pip install bleach
RUN pip install gunicorn==19.6.0
RUN pip install django-templated-email
RUN pip install djangorestframework-jsonapi
RUN pip install certbot-django

# USER ${APP_USER}
# ADD . ${APP_ROOT}
