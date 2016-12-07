#!/bin/sh
#forked from https://github.com/p365labs/tutorials/tree/master/php55_to_php56

sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php5.6-fpm
# now change the socket path in your nginx/apache2 configuration
# from (/var)/run/php5-fpm.sock to /run/php/php5.6-fpm.sock
# and restart the server

#switch from php 7 to 5.6
sudo update-alternatives --set php /usr/bin/php5.6

# stop old PHP 5 FPM
sudo service php5-fpm stop
# copy the old configuration from /etc/php5/fpm/pool.d/ to /etc/php/5.6/fpm/pool.d/
# except www.conf
sudo cp /etc/php/5.6/fpm/pool.d/www.conf /etc/php/5.6/fpm/pool.d/www.conf.bak
sudo cp /etc/php5/fpm/pool.d/www.conf /etc/php/5.6/fpm/pool.d/www.conf
sudo cp /etc/php5/fpm/php.ini /etc/php/5.6/fpm/php.ini
# disable old PHP 5 FPM
sudo update-rc.d php5-fpm disable
# restart PHP 5.6 FPM to read the new configuration
sudo service php5.6-fpm stop


sudo apt-get install -y \
php5.6-curl \
php5.6-dev \
php5.6-gd \
php5.6-intl \
php5.6-mcrypt \
php-memcache  \
php-memcached \
php5.6-mysql \
php5.6-xml \
php5.6-mbstring \
php5.6-bcmath \
php5.6-ldap \
php5.6-imagick

sudo apt-get --purge remove php5-common
sudo add-apt-repository --remove ppa:ondrej/php5-5.6

