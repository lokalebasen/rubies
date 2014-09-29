FROM lokalebasen/rubies:base
MAINTAINER Mads Ohm Larsen ml@lokalebasen.dk
ENV REFRESHED_AT 2014-09-29

ENV RBENV_VERSION 2.1.3

RUN rbenv install $RBENV_VERSION
RUN rbenv rehash
RUN gem install bundler
RUN gem install etcd -v=0.0.5
RUN gem install systemu -v=2.6.2
RUN rbenv rehash
