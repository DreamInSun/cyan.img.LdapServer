#!/bin/bash


echo ========== Start Installation ==========
export LDAP_ADMIN_USER=ldapadmin
export LDAP_ADMIN_PASSWD=ldapadmin
export LDAP_URL='dc=ecoho,dc=cn'	
export LDAP_SERVER_DOMAIN=ldap.ecoho.cn
export ADMIN_USER=admin
export ADMIN_PASSWD=123456

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
