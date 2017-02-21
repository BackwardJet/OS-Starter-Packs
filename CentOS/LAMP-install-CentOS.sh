#!/bin/bash

sudo yum install -y httpd
sudo yum install -y php php-mysql
version=$(rpm -q --queryformat '%{VERSION}' centos-release)
SEVEN=7
if [ $version -lt $SEVEN ]; then
    sudo yum install -y mysql-server
    sudo service mysqld start
    sudo /usr/bin/mysql_secure_installation
else
    sudo yum install -y mariadb-server mariadb
    sudo systemctl start mariadb
    sudo mysql_secure_installation
fi
# For MYSQL installation, set the root password and hit enter for all other prompts
sudo service httpd restart
sudo echo "<?php phpinfo(); ?>" >> /var/www/html/info.php
php -r 'echo "\n\nYour PHP is working.\n\n";'
