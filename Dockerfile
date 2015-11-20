FROM linuxserver/baseimage
MAINTAINER Pete McWilliams <petemcw@gmail.com>

ENV APTLIST="curl inotify-tools"

RUN apt-get update && \
  apt-get install $APTLIST -qy && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/*

# add custom scripts & files
ADD cron/ /etc/cron.d/
ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh

# volumes
VOLUME /config
