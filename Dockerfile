FROM ubuntu:14.04
ENV MYSQLTMPROOT root

RUN \
    apt-get update; \
    apt-get install -y nginx; \
    apt-get install -y php5; \
    apt-get install -y php5-fpm; \
    apt-get install -y php5-mysqlnd; \
    apt-get install -y php5-gd; \
    apt-get install -y php5-curl;

# Install MySQL
RUN \
    echo mysql-server mysql-server/root_password password $MYSQLTMPROOT | debconf-set-selections; \
    echo mysql-server mysql-server/root_password_again password $MYSQLTMPROOT | debconf-set-selections; \
    apt-get install -y mysql-server mysql-client

RUN \
    apt-get install -y curl; \
    apt-get install -y unzip;

RUN \
    curl -L https://github.com/lincanbin/Carbon-Forum/archive/master.zip -o /tmp/master.zip; \
    unzip /tmp/master.zip -d /tmp; \
    mv /tmp/Carbon-Forum-master /usr/share/nginx/html/Carbon-Forum;

RUN chown www-data:www-data -R /usr/share/nginx/html/Carbon-Forum/

# COPY ./Carbon-Forum /usr/share/nginx/html/Carbon-Forum
COPY start.sh /root/start.sh
COPY carbon.conf /etc/nginx/conf.d/carbon.conf


VOLUME /var/lib/mysql
EXPOSE 8080

CMD ["/bin/bash", "/root/start.sh"]
