Rubies
======

Template for building new docker base images with Ruby

Edit `Dockerfile`, docker build and push your new versions to Docker Hub as you see fit. Naming convention is `matchoffice/rubies:2.3.1`

Notes:

- supervisor is installed via python pip, because the one in ubuntu's repositories is outdated
- nodejs is installed to ensure a runtime for execjs in Rails app. However, `mini_racer` seems to be the preferred way of doing it, so if all rails apps are migrated to mini_racer, you could remove nodejs from the base image.
