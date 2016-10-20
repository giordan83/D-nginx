# Debian: essential
#
# VERSION 0.1

# Pull the base image.
FROM giordan/d-essentials

MAINTAINER Gabriele Giuranno <gabrielegiuranno@gmail.com>

# Set environment variables.
ENV FILES conf/
ENV TERM xterm-256color

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						ca-certificates \
						nginx \
						nginx-module-xslt \
						nginx-module-geoip \
						nginx-module-image-filter \
						nginx-module-perl \
						nginx-module-njs \
						gettext-base \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

RUN apt-get clean

ADD ${FILES}nginx.conf /etc/nginx/nginx.conf

RUN usermod -u 1000 www-data

ADD start.sh /usr/local/bin/start.sh

# Configure executable to start nginx.
CMD ["start.sh"]


# Expose ports.
EXPOSE 80 443
