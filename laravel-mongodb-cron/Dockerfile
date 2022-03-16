FROM frambla/laravel-mongodb-poppler:latest

# Change current user to root
USER root

RUN apt-get update \ 
  && apt-get -y install -qq --force-yes cron

COPY runjobs.sh /usr/local/bin
RUN chmod +x /usr/local/bin/runjobs.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER www

ENTRYPOINT [ "/entrypoint.sh" ]
