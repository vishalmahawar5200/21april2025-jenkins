FROM ubuntu:latest

WORKDIR /var/www/html

COPY index.html /var/www/html/index.html

EXPOSE 80

CMD ["apachectl","-D","FOREGROUND"]