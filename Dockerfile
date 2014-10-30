FROM lokalebasen/rubies:base
MAINTAINER Mads Ohm Larsen ml@lokalebasen.dk
ENV REFRESHED_AT 2014-09-29

ENV RBENV_VERSION 2.1.3

RUN rbenv install $RBENV_VERSION
RUN rbenv rehash
RUN gem install bundler
RUN rbenv rehash

ONBUILD ENTRYPOINT ["go-env", "-retry=5"]
