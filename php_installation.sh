echo "===Install LAMP Stack Requirements==="

sudo yum install -y	php70
sudo yum install -y	php70-php
sudo yum install -y	php70-php-cli
sudo yum install -y	php70-php-common
sudo yum install -y	php70-php-common
sudo yum install -y	php70-php-embedded
sudo yum install -y	php70-php-gd
sudo yum install -y	php70-php-json
sudo yum install -y	php70-php-ldap
sudo yum install -y	php70-php-mbstring
sudo yum install -y	php70-php-mcrypt
sudo yum install -y	php70-php-mysqlnd
sudo yum install -y	php70-php-opcache
sudo yum install -y	php70-php-pdo
sudo yum install -y	php70-php-pear
sudo yum install -y	php70-php-pecl
sudo yum install -y php70-php-pecl-zip
sudo yum install -y	php70-php-process
sudo yum install -y	php70-php-soap
sudo yum install -y	php70-php-xml
sudo yum install -y	php70-runtime
sudo yum install -y	php73
sudo yum install -y	php73-php
sudo yum install -y	php73-php-cli
sudo yum install -y	php73-php-common
sudo yum install -y	php73-php-embedded
sudo yum install -y	php73-php-gd
sudo yum install -y	php73-php-json
sudo yum install -y	php73-php-ldap
sudo yum install -y	php73-php-mbstring
sudo yum install -y	php73-php-mysqlnd
sudo yum install -y	php73-php-opcache
sudo yum install -y	php73-php-pdo
sudo yum install -y	php73-php-pear
sudo yum install -y	php73-php-pecl
sudo yum install -y	php73-php-pecl-mcrypt
sudo yum install -y php73-php-pecl-zip
sudo yum install -y	php73-php-process
sudo yum install -y	php73-php-soap
sudo yum install -y	php73-php-xml
sudo yum install -y	php73-runtime

echo "===Install HTTPD==="
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd