FROM ubuntu:trusty
ENV REFRESHED_AT 2016-03-15

# Make sure we use 'universe'
RUN sed -i.bak 's/main$/main universe/' /etc/apt/sources.list

# Install libs
RUN apt-get update -y    && \
    apt-get install -y      \
            libreadline-dev \
            build-essential \
            libpq-dev curl  \
            redis-server    \
            git             \
            cron            \
            libxml2-dev     \
            libxslt-dev     \
            libyaml-dev     \
            supervisor      \
            libffi-dev

RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv && \
    git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build

# Setup rbenv
ENV PATH /root/.rbenv/bin:$PATH
ENV PATH /root/.rbenv/shims:$PATH

RUN eval "$(rbenv init -)" && \
    rbenv rehash           && \
    echo "---\ngem: --no-rdoc --no-ri" > /root/.gemrc
