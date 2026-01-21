FROM nginx:1.25-alpine

COPY ./production/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
