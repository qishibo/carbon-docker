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


COPY ./Carbon-Forum /usr/share/nginx/html/Carbon-Forum
COPY start.sh /root/start.sh
COPY carbon.conf /etc/nginx/conf.d/carbon.conf


RUN chown www-data:www-data -R /usr/share/nginx/html/Carbon-Forum/

VOLUME /var/lib/mysql
EXPOSE 8080

CMD ["/bin/bash", "/root/start.sh"]
