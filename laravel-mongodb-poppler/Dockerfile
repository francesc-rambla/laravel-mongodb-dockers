FROM frambla/laravel-mongodb

USER root
RUN apt-get update && apt-get install -y poppler-utils
RUN wget -q --no-check-certificate -O /tmp/xpdf-tools.tgz https://dl.xpdfreader.com/xpdf-tools-linux-4.02.tar.gz && \
    cd /tmp && \ 
    tar xzf /tmp/xpdf-tools.tgz && \
    rm /tmp/xpdf-tools.tgz && \
    cd xpdf*/bin64 && \
    for i in * ; do mv $i /usr/local/bin/xpdf-$i; done && \
    cd /tmp && \
    rm -Rf xpdf*
    
USER www
