FROM nginxinc/nginx-unprivileged:1-alpine

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./uwsgi_params /etc/nginx/uwsgi_params
COPY ./sleep.sh /sleep.sh

USER root

RUN mkdir -p /vol/static
RUN chmod 777 /vol/static
RUN chmod +x /sleep.sh


# ToDo Create a user with username 'nginx'

USER nginx
