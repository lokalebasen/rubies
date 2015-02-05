FROM lokalebasen/rubies:base
MAINTAINER Mads Ohm Larsen ml@lokalebasen.dk
ENV REFRESHED_AT 2015-02-05

ENV RBENV_VERSION 2.1.5

RUN rbenv install $RBENV_VERSION && \
    rbenv rehash                 && \
    gem install bundler          && \
    rbenv rehash

ONBUILD ENTRYPOINT ["go-env", "-retry=5"]
