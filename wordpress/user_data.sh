sudo yum update

sudo yum install -y apache2 mysql-client php libapache2-mod-php php-mysql

sudo systemctl enable httpd

sudo systemctl start httpd

wget https://wordpress.org/latest.tar.gz

tar -zxvf latest.tar.gz

sudo mv wordpress /var/www/html/wordpress

sudo chown -R www-data:www-data /var/www/html/wordpress

sudo chmod -R +x /var/www/html/wordpress

sudo systemctl restart httpd
