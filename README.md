Rubies
======

Dockerfiles for different Ruby versions

The individual images live in each their own branch and inherit from the base image and should be used like:

```
FROM matchoffice/rubies:base
ENV RBENV_VERSION 2.1.2

RUN rbenv install $RBENV_VERSION
RUN rbenv rehash
```

to install Ruby `2.1.2`
