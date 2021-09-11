#!/bin/sh
#variables
"sleep 1; clear" = csl
#
echo "updating the system";
$csl;
apt update;
$csl;
echo "upgrading the system";
apt upgrade;
$csl;
echo "install dependcies";
apt install ca-certificates apt-transport-https lsb-release gnupg curl nano unzip -y;
$csl;
wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -;
$csl;
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list;
$csl;
apt update;
$csl;
apt install apache2 -y;
$csl;
apt install php7.4 php7.4-cli php7.4-common php7.4-curl php7.4-gd php7.4-intl php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-xml php7.4-xsl php7.4-zip php7.4-bz2 libapache2-mod-php7.4 -y;
$csl;
apt install mariadb-server mariadb-client -y;
$csl;
mysql_secure_installation;
$csl;
cd /usr/share;
$csl;
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip -O phpmyadmin.zip;
$csl;
unzip phpmyadmin.zip;
$csl;
rm phpmyadmin.zip;
$csl;
mv phpMyAdmin-*-all-languages phpmyadmin;
$csl;
chmod -R 0755 phpmyadmin;
$csl;
wget https://raw.githubusercontent.com/2duo/mariadbautomaticinstall/main/phpmyadmin.conf -P /etc/apache2/conf-avaible;
$csl;
a2enconf phpmyadmin;
$csl;
systemctl reload apache2;
$csl;
mkdir /usr/share/phpmyadmin/tmp/;
$csl;
chown -R www-data:www-data /usr/share/phpmyadmin/tmp/;
$csl;
echo "please create a user. thx for using the script <3"
