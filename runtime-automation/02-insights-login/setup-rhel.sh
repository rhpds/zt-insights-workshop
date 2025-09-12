#!/bin/sh
echo "Starting module called 02-insights-login" >> /tmp/progress.log

# sed -i 's/ClientAliveInterval.*900//g' /etc/ssh/sshd_config
# sed -i '/\[rhel-10-for-x86_64-baseos-rpms\]/,/^ *\[/ s/gpgcheck = 1/gpgcheck = 0/' /etc/yum.repos.d/redhat.repo
# sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
chmod 777 /etc/ssh/sshd_config
chmod +0777 /etc/shadow
insights-client
