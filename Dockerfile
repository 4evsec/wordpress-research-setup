FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        php-cli \
        php-mysql \
        php-curl \
        php-mbstring \
        php-xml \
        php-zip \
        php-cli \
        composer \
        jq \
        unzip \
        tmux \
        ripgrep

USER www-data

COPY ./tools /tools/
WORKDIR /tools
RUN composer install --no-interaction -vvv

ENV PATH="/opt/bin:/tools/vendor/bin:$PATH"

WORKDIR /var/www/html