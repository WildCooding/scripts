#!/bin/bash

# MySQL Installation
echo "MySQL Installation"
read -p "MySQL Root-Passwort [root]: " mysql_password
mysql_password=${mysql_password:-root}  # Standardwert 'root' verwenden

# Apache Installation
echo "Apache Installation"
# Füge hier weitere Apache-Konfigurationen hinzu, falls erforderlich

# PHPMyAdmin Installation
echo "phpMyAdmin Installation"
read -p "PHPMyAdmin Passwort [root]: " phpmyadmin_password
phpmyadmin_password=${phpmyadmin_password:-root}  # Standardwert 'root' verwenden

# Pakete installieren
echo "Pakete installieren"
sudo apt-get update
sudo apt-get install -y apache2 mysql-server phpmyadmin

# MySQL konfigurieren
echo "MySQL konfigurieren"
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$mysql_password'; FLUSH PRIVILEGES;"

# Apache konfigurieren
echo "Apache konfigurieren"
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin.conf
sudo systemctl restart apache2

# Abschluss
echo "Installation abgeschlossen!"
