#!/bin/sh

# UPDATE REPO
cat >/etc/yum.repos.d/upgrade.repo <<EOF
[upgrade]
name=upgrade
baseurl=https://buildlogs.centos.org/centos/6/upg/x86_64/
enabled=1
gpgcheck=0
EOF


# REMOVE OLD OPENSCAP
yum -y erase openscap

# REINSTALL OPENSCAP
yum -y install https://buildlogs.centos.org/centos/6/upg/x86_64/Packages/openscap-1.0.8-1.0.1.el6.centos.x86_64.rpm

# INSTALL UPGRADE TOOLS
yum -y install preupgrade-assistant-contents redhat-upgrade-tool preupgrade-assistant
echo "y" | preupg

# ADD RPM GPG KEY FOR CENTOS 7
rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7

# UPGRADE COMMAND TO CENTOS 7
centos-upgrade-tool-cli -f --network=7  --instrepo=http://vault.centos.org/7.0.1406/os/x86_64/ --cleanup-post --nogpgcheck  -d

# CREATE MISSING LINKS 
ln -sfn /usr/lib64/libsasl2.so.3.0.0 /usr/lib64/libsasl2.so.2
ln -sfn /usr/lib64/libpcre.so.1.2.0 /lib64/libpcre.so.0 
