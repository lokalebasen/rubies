FROM lokalebasen/rubies:base
MAINTAINER Mads Ohm Larsen ml@lokalebasen.dk
ENV REFRESHED_AT 2014-08-25

ENV RBENV_VERSION 2.1.1

ENV RUBY_CONFIGURE_OPTS --with-readline-dir=/usr/lib/x86_64-linux-gnu/libreadline.so
RUN rbenv install $RBENV_VERSION
RUN rbenv rehash
RUN gem install bundler
RUN rbenv rehash

ONBUILD ENTRYPOINT ["go-env", "-retry=5"]
