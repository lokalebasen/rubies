Rubies
======

Template for building new docker base images with Ruby

Edit `Dockerfile`, docker build and push your new versions to Docker Hub as you see fit. Naming convention is `matchoffice/rubies:x.y.z`. e.g.:

```bash
  docker build -t matchoffice/rubies:2.4.1 .
  docker push matchoffice/rubies:2.4.1
```

Notes:

- supervisor is installed via python pip, because the one in ubuntu's repositories is outdated.
- nodejs is installed to ensure a runtime for execjs in Rails app.
