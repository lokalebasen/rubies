FROM ubuntu:xenial
ENV REFRESHED_AT 2016-05-04

# Make sure we use 'universe'
RUN sed -i.bak 's/main$/main universe/' /etc/apt/sources.list

# Install libs
RUN apt-get update -y    && \
    apt-get install -y      \
            libreadline-dev \
            build-essential \
            libpq-dev       \
            curl            \
            git             \
            libxml2-dev     \
            libxslt-dev     \
            libyaml-dev     \
            libffi-dev      \
            python-pip

RUN pip install supervisor

RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv && \
    git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build

# Setup rbenv
ENV PATH /root/.rbenv/bin:$PATH
ENV PATH /root/.rbenv/shims:$PATH

RUN eval "$(rbenv init -)" && \
    rbenv rehash           && \
    echo "---\ngem: --no-rdoc --no-ri" > /root/.gemrc

RUN rbenv install 2.3.0
RUN rbenv global 2.3.0
RUN gem install bundler
RUN rbenv rehash
