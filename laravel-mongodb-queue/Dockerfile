FROM frambla/laravel-mongodb-poppler:latest

# Set working directory
WORKDIR /var/www

# Set user root
USER root

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
    supervisor

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisor && chown -R www /var/log/supervisor

# Change current user to www
USER www

CMD ["/usr/bin/supervisord"]
