FROM alpine
Maintainer drajathasan
RUN apk add php8-curl php8 php8-xmlwriter php8-openssl php8-tokenizer php8-bcmath php8-dom php8-pdo php8-pdo_mysql php8-gd php8-mbstring php8-apache2 apache2 php8-session php8-json php8-mysqli php8-gettext php8-fileinfo php8-ctype php8-xml php8-simplexml php8-phar shadow
WORKDIR /var/www/localhost/htdocs
RUN ln -s /usr/bin/php8 /usr/bin/php
RUN ln -s /usr/bin/phpize8 /usr/bin/phpize
RUN ln -s /usr/bin/pecl8 /usr/bin/pecl
RUN ln -s /usr/bin/php-config8 /usr/bin/php-config
COPY ./composer /bin/
RUN usermod -u 1000 apache
RUN chmod +x /bin/composer
EXPOSE 80
CMD  [ "/usr/sbin/httpd", "-D", "FOREGROUND"]
