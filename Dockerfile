FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY html/ /usr/share/nginx/html/

## Prepare nginx's directory and set the correct rights
RUN mkdir -p /var/cache/nginx /var/log/nginx /var/run/nginx \
  && chown -R nginx:nginx /var/cache/nginx /var/log/nginx /var/run/nginx

USER nginx

EXPOSE 8080/tcp
