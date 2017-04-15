FROM python:2-alpine
RUN apk add --no-cache lighttpd
RUN pip install --no-cache-dir Flask
ADD ./lighttpd.conf /etc/lighttpd/lighttpd.conf
ADD ./jekyll-site/_site /var/www/public/static
ADD ./server-python /var/www/fcgi/voltorbflip
ENTRYPOINT ["lighttpd", "-Df/etc/lighttpd/lighttpd.conf"]
EXPOSE 80
