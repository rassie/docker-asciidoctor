FROM alpine:3.6

LABEL MAINTAINERS="Guillaume Scheibel <guillaume.scheibel@gmail.com>, Damien DUPORTAL <damien.duportal@gmail.com>"

# Check https://pkgs.alpinelinux.org/packages?name=asciidoctor&branch=&repo=&arch=&maintainer=
ENV ASCIIDOCTOR_VERSION="1.5.5-r1"

RUN apk add --no-cache \
    asciidoctor="${ASCIIDOCTOR_VERSION}" \
    bash \
    curl \
    ca-certificates \
    findutils \
    py2-pillow \
    python2 \
    ruby \
    ruby-mathematical \
    ruby-pygments \
    ttf-liberation \
    unzip \
    which \
  && apk add --no-cache --virtual .makedepends \
    build-base \
    libxml2-dev \
    python2-dev \
    py2-pip \
    ruby-dev \
  && gem install --no-document asciidoctor-epub3 --version 1.5.0.alpha.7 \
  && gem install --no-document asciidoctor-pdf --version 1.5.0.alpha.15 \
  && gem install --no-document epubcheck --version 3.0.1 \
  && gem install --no-document kindlegen --version 3.0.3 \
  && gem install --no-document asciidoctor-revealjs \
  && gem install --no-document asciidoctor-diagram \
  && gem install --no-document asciidoctor-confluence \
  && gem install --no-document asciidoctor-mathematical \
  && gem install --no-document rake rouge coderay thread_safe slim haml tilt \
  && pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir seqdiag actdiag nwdiag 'blockdiag[pdf]' \
  && apk del -r --no-cache .makedepends

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
