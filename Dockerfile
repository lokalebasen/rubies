FROM lokalebasen/rubies:base
MAINTAINER Mads Ohm Larsen ml@lokalebasen.dk
ENV REFRESHED_AT 2015-02-03

ENV RBENV_VERSION 1.9.3-p547

RUN rbenv install $RBENV_VERSION
RUN rbenv rehash
RUN gem install bundler
RUN rbenv rehash

ONBUILD ENTRYPOINT ["go-env", "-retry=5"]
