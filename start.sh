
mysql_install_db;

service mysql start;
service nginx start;
service php5-fpm start;

echo 'create database carbon;' | mysql -h localhost -uroot -proot;

/bin/bash;
