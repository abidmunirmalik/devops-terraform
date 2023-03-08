#!/bin/bash
yum -y install wget
wget https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm
yum -y localinstall mysql80-community-release-el7-3.noarch.rpm
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
yum -y install mysql-community-server
systemctl enable mysqld.service
systemctl start mysqld.service
