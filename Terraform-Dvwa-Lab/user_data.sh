#!/bin/bash
sudo apt update -y
sudo apt install -y apache2 mysql-server php php-mysqli php-gd libapache2-mod-php git unzip

# DVWA配置
cd /var/www/html
sudo git clone https://github.com/digininja/DVWA.git
sudo chown -R www-data:www-data /var/www/html/DVWA

# DB設定
sudo mysql -u root <<EOF
CREATE DATABASE dvwa;
CREATE USER 'dvwa'@'localhost' IDENTIFIED BY 'p@ssw0rd';
GRANT ALL PRIVILEGES ON dvwa.* TO 'dvwa'@'localhost';
FLUSH PRIVILEGES;
EOF

sudo sed -i "s/p@ssw0rd/p@ssw0rd/" /var/www/html/DVWA/config/config.inc.php.dist
sudo cp /var/www/html/DVWA/config/config.inc.php.dist /var/www/html/DVWA/config/config.inc.php

sudo systemctl enable apache2
sudo systemctl restart apache2
