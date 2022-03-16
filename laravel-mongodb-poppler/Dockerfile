FROM frambla/laravel-mongodb

USER root
RUN apt-get update && apt-get install -y poppler-utils wget
RUN wget -q --no-check-certificate -O /tmp/xpdf-tools.tgz https://dl.xpdfreader.com/xpdf-tools-linux-4.03.tar.gz && \
    cd /tmp && \ 
    tar xzf /tmp/xpdf-tools.tgz && \
    rm /tmp/xpdf-tools.tgz && \
    cd xpdf*/bin64 && \
    mv pdftotext /usr/local/bin/xpdf-pdftotext && \
    cd /tmp && \
    rm -Rf xpdf*
COPY pdf2html /usr/local/bin
RUN chmod +x /usr/local/bin/pdf2html    
USER www
