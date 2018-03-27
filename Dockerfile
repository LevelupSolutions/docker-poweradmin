FROM php:7.2-apache-stretch

ENV POWERADMIN_HOSTMASTER ""
ENV POWERADMIN_NS1 8.8.8.8
ENV POWERADMIN_NS2 8.8.4.4
ENV DNS_TTL 86400

ENV MYSQL_HOST localhost
ENV MYSQL_PORT 3306
ENV MYSQL_USER pdns
ENV MYSQL_PASS pdns
ENV MYSQL_DB pdns

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y \
        mariadb-client \
        libmcrypt-dev \
        unzip
RUN docker-php-ext-install \
        mysqli \
        pdo \
        pdo_mysql \
        gettext
RUN curl -L https://github.com/poweradmin/poweradmin/archive/master.zip > /poweradmin.zip \
 && unzip /poweradmin.zip -d /var/www \
 && rm -rf /var/www/html \
 && mv /var/www/poweradmin* /var/www/html \
 && chown -R root:root /var/www/html
RUN apt-get autoremove --purge -y \
 && rm -rf /var/lib/apt/lists/* /poweradmin.zip  /var/www/html/install

COPY assets/config.inc.php /var/www/html/inc/config.inc.php
COPY assets/poweradmin.sql entrypoint.sh /
COPY assets/php.ini /usr/local/etc/php

ENTRYPOINT [ \
    "/bin/bash", \
    "/entrypoint.sh" \
]