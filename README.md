Rubies
======

Dockerfiles for different Ruby versions

All the images lives in their own folder and are automatically built by Docker.

The individual images inherit from the base image and should be used like:

```
FROM lokalebasen/rubies:base
ENV RBENV_VERSION 2.1.2

RUN rbenv install $RBENV_VERSION
RUN rbenv rehash
```

to install Ruby `2.1.2`
