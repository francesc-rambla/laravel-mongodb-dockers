FROM php:7.4-fpm-bullseye

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    autoconf pkg-config libssl-dev\
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libonig-dev \
    libzip-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    unzip \
    git \
    curl \
    zlib1g-dev \
    cmake

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN cd /tmp && \			
    git clone https://github.com/libssh2/libssh2.git && \
    cd libssh2 && \
    git checkout tags/libssh2-1.11.1 -b build_branch && \
    mkdir build && \
    cd build && \
    cmake .. -DENABLE_ZLIB_COMPRESSION=ON -DENABLE_CRYPT_NONE=OFF -DENABLE_MAC_NONE=OFF -DCMAKE_BUILD_TYPE=Release && \
    make && \
    make install && \
    ldconfig && \
    pkg-config --modversion libssh2 && \
    cd /tmp && \
    rm -Rf libssh2

# Use the production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Install extensions
RUN pecl install mongodb
RUN docker-php-ext-install pdo_mysql mysqli mbstring zip exif pcntl bcmath calendar
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ 
RUN docker-php-ext-install gd
RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini
RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache
RUN apt-get update && apt-get install -y \
    redis-server \
    && pecl install redis \
    && docker-php-ext-enable redis

# Add user for laravel application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Change current user to www
USER www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
