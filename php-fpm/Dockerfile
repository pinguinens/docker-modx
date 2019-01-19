FROM php:7.3.1-fpm
ENV MODX_VER 2.7.0
ENV ENTRYPOINT_PATH /usr/local/bin
ENV SRC_ROOT /var/www/src

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libmagickcore-6.q16-dev libmagickwand-6.q16-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) \
        gd \
        mysqli \
        pdo_mysql

RUN pecl install \
    && pecl install \
        # xdebug-2.7.0beta1 \
        imagick \
    && docker-php-ext-enable \
        # xdebug \
        imagick

RUN mkdir -p ${SRC_ROOT} \
    && mkdir -p ${SRC_ROOT}/modx \
    && curl -o ${SRC_ROOT}/modx.tar.gz -SL https://github.com/modxcms/revolution/archive/v${MODX_VER}-pl.tar.gz \
    && tar xfvz ${SRC_ROOT}/modx.tar.gz -C ${SRC_ROOT}/modx --strip=1 \
        revolution-$MODX_VER-pl/connectors \
        revolution-$MODX_VER-pl/core \
        revolution-$MODX_VER-pl/manager \
        revolution-$MODX_VER-pl/setup \
        revolution-$MODX_VER-pl/_build \
        revolution-$MODX_VER-pl/index.php \
        revolution-$MODX_VER-pl/ht.access

COPY docker-container-start.sh docker-modx-prepare.sh docker-modx-cli-install.sh $ENTRYPOINT_PATH/

RUN chmod 0777 \
        $ENTRYPOINT_PATH/docker-container-start.sh \
        $ENTRYPOINT_PATH/docker-modx-prepare.sh \
        $ENTRYPOINT_PATH/docker-modx-cli-install.sh \
    && chmod +x \
        $ENTRYPOINT_PATH/docker-container-start.sh \
        $ENTRYPOINT_PATH/docker-modx-prepare.sh \
        $ENTRYPOINT_PATH/docker-modx-cli-install.sh

ENTRYPOINT ["/usr/local/bin/docker-container-start.sh"]