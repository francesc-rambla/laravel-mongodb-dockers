FROM frambla/laravel-mongodb

USER root
RUN apt-get update && apt-get install -y poppler-utils wget tesseract-ocr
RUN wget -q --no-check-certificate -O /tmp/xpdf-tools.tgz https://dl.xpdfreader.com/xpdf-tools-linux-4.04.tar.gz && \
    cd /tmp && \ 
    tar xzf /tmp/xpdf-tools.tgz && \
    rm /tmp/xpdf-tools.tgz && \
    cd xpdf*/bin64 && \
    mv pdftotext /usr/local/bin/xpdf-pdftotext && \
    cd /tmp && \
    rm -Rf xpdf*
COPY pdf* /usr/local/bin/
RUN chmod +x /usr/local/bin/pdf*   
USER www
