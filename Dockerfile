# Version 1.0.0
# cyan.img.Lamp

#========== Basic Image ==========
From centos:6.7
MAINTAINER "DreamInSun"

#========== Install EPEL & REMI ==========
ADD rpm /rpm
RUN rpm -Uvh /rpm/epel-release-6-8.noarch.rpm
RUN rpm -Uvh /rpm/remi-release-6.rpm

#========== Install 389 DS ==========



#========== Edit Config ==========
RUN echo ulimit -n 8192 >> /etc/profile
RUN echo session    required     /lib/security/pam_limits.so >> /etc/pam.d/login
RUN useradd ldapadmin & passwd ldapadmin

#========== Install 389 DirSrv ==========
RUN yum install -y 389-ds openldap-clients
#RUN setup-ds-admin.pl

#========== Expose ==========
EXPOSE 389
EXPOSE 636
EXPOSE 9830

#========== Entry Point ==========
