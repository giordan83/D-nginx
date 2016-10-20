## Dockerfile : Debian - nginx

[![Docker Pulls](https://img.shields.io/docker/pulls/giordan/d-nginx.svg)]()

**Dockerfile** of [Debian](https://www.debian.org/) nginx:

- ca-certificates 
- nginx 
- nginx-module-xslt
- nginx-module-geoip
- nginx-module-image-filter
- nginx-module-perl
- nginx-module-njs
- gettext-base

*Requirements*
- [Docker](https://www.docker.com/)
- [giordan/d-essentials] (https://hub.docker.com/r/giordan/d-essentials/)

*Base Docker Image*
- [giordan/d-essentials] (https://hub.docker.com/r/giordan/d-essentials/)

*Docker Pull Command*
- `docker pull giordan/D-nginx`

### Usage

Build the image.

    $ make

Run the interactive container.

    $ make run

*See the `Makefile` for more options.
