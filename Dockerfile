# Container image that runs your code
FROM php:8.1-cli-alpine

RUN apk add --no-cache \
      libzip-dev \
      zip \
    && docker-php-ext-install zip

COPY --from=composer:2.2 /usr/bin/composer /usr/local/bin/composer

RUN /usr/local/bin/composer config allow-plugins.composer/installers true
RUN /usr/local/bin/composer config allow-plugins.dealerdirect/phpcodesniffer-composer-installer true
RUN /usr/local/bin/composer global require --dev magento/magento-coding-standard -n

RUN ~/.composer/vendor/bin/phpcs --config-set installed_paths ../../magento/magento-coding-standard/,../../phpcompatibility/php-compatibility/PHPCompatibility
RUN echo memory_limit = -1 >> /usr/local/etc/php/conf.d/custom-memory.ini
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]