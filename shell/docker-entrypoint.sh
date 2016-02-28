#!/bin/bash


echo ========== Start Installation ==========


echo ========== Create User ===========
useradd     ldapadmin 
passwd      ldapadmin

echo ========== Setup DS Admin ==========
setup-ds-admin.pl --version
setup-ds-admin.pl --file=/shell/ds-admin.inf

echo ========== Start Apache2 ==========
 

