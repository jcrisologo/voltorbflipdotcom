FROM python:2-alpine
ADD ./jekyll-site/_site /var/www/public/static
ADD ./server-python /var/www/fcgi/voltorbflip
RUN apk add --no-cache lighttpd
RUN pip install --no-cache-dir Flask
ENTRYPOINT ["lighttpd", "-Df/etc/lighttpd/lighttpd.conf"]
EXPOSE 80
