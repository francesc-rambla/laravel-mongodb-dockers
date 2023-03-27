FROM frambla/laravel-mongodb

USER root

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install EB CLI dependencies
RUN apt-get update && \
    apt-get install -y \
      zlib1g-dev \
      libncurses-dev \
      libffi-dev \
      libsqlite3-dev \
      libreadline-dev \
      libbz2-dev \
      python3-pip

RUN apt-get update && \
    apt-get install -y \
	nodejs \
	npm

RUN apt-get clean

# Install EB CLI
#RUN pip3 install awsebcli --upgrade
#RUN git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git && \
#    ./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer

USER www
