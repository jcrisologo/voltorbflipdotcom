FROM python:2
ADD ./jekyll-site/_site /var/www/public/static
ADD ./server-python /var/www/fcgi/voltorbflip
RUN pip install Flask
RUN apt-get update && apt-get install -y lighttpd
ENTRYPOINT ["lighttpd", "-Df/etc/lighttpd/lighttpd.conf"]
EXPOSE 80
