#!/bin/bash

sudo yum install -y httpd
sudo yum install -y php php-mysql
version=$(rpm -q --queryformat '%{VERSION}' centos-release)
SEVEN=7
if [ $version -lt $SEVEN ]; then
    sudo yum install -y mysql-server
else
    sudo yum install -y mariadb-server
fi
sudo service httpd restart
sudo echo "<?php phpinfo(); ?>" >> /var/www/html/info.php
php -r 'echo "\n\nYour PHP is working.\n\n";'
