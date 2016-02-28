#!/bin/bash


echo ========== Start Installation ==========


echo ========== Create User ===========
groupadd    ldapadmin
useradd     ldapadmin 
passwd      ldapadmin

echo ========== Setup DS Admin ==========
setup-ds-admin.pl --version
setup-ds-admin.pl --silent --file=/shell/ds-admin.inf  

echo ========== Start LDAP Server ==========
 

