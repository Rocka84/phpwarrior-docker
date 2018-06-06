FROM php:5.6
WORKDIR /

RUN apt-get update \
    && apt-get install -y --no-install-recommends zip unzip \
    && curl https://getcomposer.org/composer.phar > /tmp/composer.phar \
    && export COMPOSER_ALLOW_SUPERUSER=1 \
    && php /tmp/composer.phar global require "yandod/php-warrior=*" \
    && php /tmp/composer.phar clearcache \
    && rm -rf /tmp/composer.phar

VOLUME [ "/phpwarrior" ]

CMD /root/.composer/vendor/bin/phpwarrior

