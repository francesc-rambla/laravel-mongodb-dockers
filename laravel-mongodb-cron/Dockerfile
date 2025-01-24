FROM frambla/laravel-mongodb-poppler:latest

# Change current user to root
USER root

RUN apt-get update \ 
  && apt-get -y install -qq --force-yes cron logrotate

RUN apt-get install -y libssh2-1-dev libssh2-1 && \
    pecl channel-update pecl.php.net && \
    curl http://pecl.php.net/get/ssh2-1.4.1.tgz -o ssh2.tgz && \
    pecl install ssh2 ssh2.tgz && \
    docker-php-ext-enable ssh2 && \
    rm -rf ssh2.tgz 

RUN apt-get install -y ftp

RUN apt-get clean 

COPY *.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["cron","-f", "-l", "2"]
