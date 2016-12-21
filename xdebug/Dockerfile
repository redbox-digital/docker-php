FROM redboxdigital/php:7.0

RUN set -xe; \
        \
        apk add --no-cache --virtual .build-deps \
                autoconf \
                gcc \
                libc-dev \
                make \
        ; \
        \
        pecl install xdebug; \
        docker-php-ext-enable xdebug; \
        \
        apk del .build-deps; \
        { \
                echo ""; \
                echo "xdebug.remote_enable=1"; \
                echo "xdebug.remote_handler=dbgp"; \
                echo "xdebug.remote_autostart=1"; \
                echo "xdebug.default_enable=1"; \
                echo "xdebug.remote_host=$(/sbin/ip route | awk '/default/ { print $3 }')"; \
                echo "xdebug.remote_port=9000"; \
                echo "xdebug.idekey=\"docker\""; \
        } | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;
