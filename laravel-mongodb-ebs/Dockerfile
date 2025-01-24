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
      python3-pip \
      gpg

RUN apt-get clean

RUN [ -d /etc/apt/keyrings ] || mkdir -p /etc/apt/keyrings ; \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    ls -la /etc/apt/keyrings/ && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y nodejs &&  \ 
    echo "Dockerfile: Node.js version: $(node -v)" && \
    echo "Dockerfile: npm version: $(npm -v)"

RUN apt-get clean

# Install EB CLI
#RUN pip3 install awsebcli --upgrade
#RUN git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git && \
#    ./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer

# USER www
