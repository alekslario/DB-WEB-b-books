#!/bin/bash
#mysql
sudo apt update
sudo apt install mysql-server
sudo systemctl start mysql.service
# create random password
PASSWDDB="qwertyuiop"
MAINDB="bettys_books"
# replace "-" with "_" for database username
USER="bettys_books_app"
#create database

sudo mysql <<MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS  ${MAINDB} /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER ${USER}@localhost IDENTIFIED BY '${PASSWDDB}';
GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${USER}'@'localhost';
FLUSH PRIVILEGES;
USE ${MAINDB};
source create_db.sql;
MYSQL_SCRIPT