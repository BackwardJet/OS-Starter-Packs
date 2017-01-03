#!/bin/bash

sudo yum install -y httpd
sudo yum install -y mariadb-server
sudo yum install -y php php-mysql
sudo service httpd restart
sudo echo "<?php phpinfo(); ?>" >> /var/www/html/info.php
php -r 'echo "\n\nYour PHP is working.\n\n";'
