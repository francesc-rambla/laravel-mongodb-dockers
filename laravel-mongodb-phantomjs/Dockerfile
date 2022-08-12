FROM frambla/laravel-mongodb

USER root
RUN apt-get update && apt-get install -y poppler-utils wget
RUN wget -q --no-check-certificate -O /tmp/xpdf-tools.tgz https://dl.xpdfreader.com/xpdf-tools-linux-4.04.tar.gz && \
    cd /tmp && \ 
    tar xzf /tmp/xpdf-tools.tgz && \
    rm /tmp/xpdf-tools.tgz && \
    cd xpdf*/bin64 && \
    mv pdftotext /usr/local/bin/xpdf-pdftotext && \
    cd /tmp && \
    rm -Rf xpdf*
RUN apt-get install -y build-essential chrpath libssl-dev libxft-dev libfreetype6-dev libfreetype6 libfontconfig1-dev libfontconfig1
RUN wget -q --no-check-certificate -O /tmp/phantomjs.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    cd /tmp && \
    tar xvjf phantomjs.tar.bz2 -C /usr/local/share && \
    ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/

USER www
