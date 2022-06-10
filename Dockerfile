FROM ubuntu:xenial

# Setting output to non-interactive
ENV DEBIAN_FRONTEND noninteractive

# Make sure we use 'universe'
RUN sed -i.bak 's/main$/main universe/' /etc/apt/sources.list

# Install libs
RUN apt-get update -y    && \
    apt-get install -y      \
            apt-utils       \
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

# Upgrading pip and installing supervisord
RUN pip install --upgrade pip && pip install supervisor

# Add Node repo
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - > /dev/null
RUN apt-get install -y nodejs

RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv && \
    git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build

# Setup rbenv
ENV PATH /root/.rbenv/bin:$PATH
ENV PATH /root/.rbenv/shims:$PATH

RUN eval "$(rbenv init -)" && \
    rbenv rehash           && \
    echo "---\ngem: --no-rdoc --no-ri" > /root/.gemrc

RUN rbenv install 2.5.0
RUN rbenv global 2.5.0
RUN gem install bundler
RUN rbenv rehash
