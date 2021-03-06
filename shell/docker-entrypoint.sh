#!/bin/bash


echo ========== Start Installation ==========
echo LDAP_ADMIN_USER = $LDAP_ADMIN_USER
echo LDAP_ADMIN_PASSWD = $LDAP_ADMIN_PASSWD
echo LDAP_URL = $LDAP_URL
echo LDAP_SERVER_DOMAIN = $LDAP_SERVER_DOMAIN
echo ADMIN_USER = $ADMIN_USER
echo ADMIN_PASSWD = $ADMIN_PASSWD


echo ========== Create Ldap Admin ===========
groupadd    ldapadmin
useradd     $LDAP_ADMIN_USER 
passwd      $LDAP_ADMIN_PASSWD

echo ========== Prepare Setup Configuration File ==========

sed -i 's/{LDAP_ADMIN_USER}/'$LDAP_ADMIN_USER'/g' 			/shell/ds-admin.inf 
sed -i 's/{LDAP_ADMIN_PASSWD}/'$LDAP_ADMIN_PASSWD'/g' 		/shell/ds-admin.inf 
sed -i 's/{LDAP_URL}/'$LDAP_URL'/g' 							/shell/ds-admin.inf 
sed -i 's/{LDAP_SERVER_DOMAIN}/'$LDAP_SERVER_DOMAIN'/g' 		/shell/ds-admin.inf 
sed -i 's/{ADMIN_USER}/'$ADMIN_USER'/g' 						/shell/ds-admin.inf 
sed -i 's/{ADMIN_PASSWD}/'$ADMIN_PASSWD'/g' 					/shell/ds-admin.inf 

cat /shell/ds-admin.inf 


echo ========== Setup DS Admin ==========
setup-ds-admin.pl --version
setup-ds-admin.pl --silent --file=/shell/ds-admin.inf  
cat /tmp/setup*.log

echo ========== Start LDAP Server ==========
# To start or stop directory server use >start-dirsrv >stop-dirsrv
# To start or stop directory server admin use >start-ds-admin >stop-ds-admin
# You can locate important configuration files @/etc/dirsrv/
# You can locate related log files @/var/log/dirsrv

start-dirsrv
start-ds-admin

service dirsrv status
service dirsrv-admin status

ls /var/log/dirsrv
#tailf /var/log/dirsrv

