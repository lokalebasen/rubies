FROM ubuntu:precise
MAINTAINER Mads Ohm Larsen ml@lokalebasen.dk
ENV REFRESHED_AT 2014-09-30

# Make sure we use 'universe'
RUN sed -i.bak 's/main$/main universe/' /etc/apt/sources.list

# Install libs
RUN apt-get update -y
RUN apt-get install -y build-essential libpq-dev curl redis-server git cron libxml2-dev libxslt-dev libyaml-dev supervisor

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /.rbenv/plugins/ruby-build

# Setup rbenv
ENV PATH /.rbenv/bin:$PATH
ENV PATH /.rbenv/shims:$PATH
RUN eval "$(rbenv init -)"
RUN rbenv rehash

RUN echo "---\ngem: --no-rdoc --no-ri" > ~/.gemrc

# Setup ETCD
RUN curl -L -o /bin/etcdenv "https://gist.github.com/fracklen/56cd1440ed3785aadfdf/raw/92d168d931fe5c4132e7bbbd774177cdce0d9ad9/with_etcd_environment"
RUN chmod +x /bin/etcdenv

# Setup locale
RUN locale-gen da_DK.UTF-8
RUN update-locale
ENV LANG en_US.UTF-8
ENV LC_ALL da_DK.UTF-8
ENV LC_CTYPE da_DK.UTF-8

# Set default envs
ENV PORT 8080
