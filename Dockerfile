FROM ubuntu:trusty
MAINTAINER Mads Ohm Larsen ml@lokalebasen.dk
ENV REFRESHED_AT 2015-02-03

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

# Setup ETCD
RUN curl -Lo /bin/go-env.gz "https://github.com/lokalebasen/go-env/releases/download/0.4/go-env-0.4-linux-amd64.gz" && \
    gunzip /bin/go-env.gz && \
    chmod +x /bin/go-env

# Setup locale
RUN locale-gen da_DK.UTF-8 && \
    update-locale

ENV LANG en_US.UTF-8
ENV LC_ALL da_DK.UTF-8
ENV LC_CTYPE da_DK.UTF-8

# Set default envs
ENV PORT 8080

# Default entry point
ENTRYPOINT ["go-env", "-retry=5"]
