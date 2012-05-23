#!/bin/sh

#run this from directory rpm was extracted from as root

#8) Installing Oracle 11gR2 Express Edition

#The final release version of Oracle 11gR2 Express Edition can be downloaded for free at http://otn.oracle.com/database/express-edition/downloads. The software should automatically downloaded into the "Downloads" folder of your home directory. 

#Enter the following commands to unpack the installer:
#cd ~/Downloads
#unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip
#rm oracle-xe-11.2.0-1.0.x86_64.rpm.zip

#The Debian Linux based package management of Ubuntu is not compatible with the Red Hat package manager. The Oracle installer needs to be converted using the following commands:
#cd ~/Downloads/Disk1
##alien --to-deb --scripts oracle-xe-11.2.0-1.0.x86_64.rpm
#(This may take a few minutes)
#rm oracle-xe-11.2.0-1.0.x86_64.rpm
dpkg --install ./oracle-xe_11.2.0-2_amd64.deb
/etc/init.d/oracle-xe configure

#post-install as oracle user

#su - oracle
#cp /etc/skel/.bash_logout ./ 
#cp /etc/skel/.bashrc ./ 
#cp /etc/skel/.profile ./ 
#echo "" >>./.profile
#echo '. /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh' >>./.profile


