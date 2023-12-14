# Dataplant-GDB

|-----------| ohadii_chlorella_postgres | ohadii_chlorella_gdb |
|-----------|:-------------------------:|:--------------------:|
|**Version**| <a href="https://hub.docker.com/r/csbdocker/ohadii_chlorella_postgres">![Docker Image Version (latest semver)](https://img.shields.io/docker/v/csbdocker/ohadii_chlorella_postgres?logo=docker&label=postgres)</a>|<a href="https://hub.docker.com/r/csbdocker/ohadii_chlorella_gdb">![Docker Image Version (latest semver)](https://img.shields.io/docker/v/csbdocker/ohadii_chlorella_gdb?logo=docker&label=gdb)</a>|

Two docker images are built from this repository which can be used to setup and host a fully functional [easy_gdb
](https://github.com/noefp/easy_gdb) genome database browser for [*Chlorella ohadii*](https://de.wikipedia.org/wiki/Chlorella).

# docker-compose

```yml
version: "3.9"

name: dataplant_gdb

services:
  easy_gdb:
    image: csbdocker/ohadii_chlorella_gdb:latest
    container_name: gdb-test
    build:
      context: .
    ports:
      - "8000:80"
    environment:
      # mirror this in DB
      - POSTGRES_USERPW=test
      # This must equal the docker compose name of the postgres service
      - POSTGRES_DB=postgres-db
  postgres-db:
    image: csbdocker/ohadii_chlorella_postgres:latest
    container_name: postgres-test
    volumes:
      - ./postgres-data:/var/lib/postgresql/data
      # path to postgres init data
      # - ./db_init:/docker-entrypoint-initdb.d
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_PASSWORD=1234
      # mirror this in easy_gdb
      - POSTGRES_USERPW=test
```

1. Run `docker-compose -f path\to\docker.compose.yml up` to start the docker stack.
2. Go to: http://localhost:8000/easy_gdb/ 🎉


This docker compose example will store all postgres db data in a mounted volume `./postgres-data` on the folder level of the docker compose file.

# Config

- **docker image names** are set in `SharedLiterals`, and referenced in `easyGDB_docker/docker.compose.new.yml`.
- **postgres initial database** is set from files in `easyGDB_docker/db_init`

# Scripts

## Create new images from dev version

This will only create new local images!

1. Run `.\createNewDockerImage.cmd` (will create new images from src with *new* tag)
2. Verify image by building container with `verifyNewImage.cmd`. 👀 Remember to delete `easyGDB_docker/postgres-data` to reset db and verify correct db setup.

## Publish to docker-hub

✅ Ensure you are logged into csb-docker

1. Run `.\publishNewVersion`. This will publish a ":latest" and a ":<next_version>" of the current images.

