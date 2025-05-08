#!/bin/bash

#set up tmux so it has to restart itself whenever the system reboots

#step 1: make a script
tee ~/startup-tmux.sh << EOF
TMUX='' tmux new-session -d -s 'rhel-session' > /dev/null 2>&1
tmux set -g pane-border-status top
tmux setw -g pane-border-format ' #{pane_index} #{pane_current_command}'
tmux set -g mouse on
tmux set mouse on
EOF

#step 2: make it executable
chmod +x ~/startup-tmux.sh
#step 3: use cron to execute 
echo "@reboot ~/startup-tmux.sh" | crontab -

#step 4: start tmux for the lab
~/startup-tmux.sh


subscription-manager config --rhsm.manage_repos=1
subscription-manager register --activationkey=${ACTIVATION_KEY} --org=12451665 --force

echo "Adding wheel" > /root/post-run.log
usermod -aG wheel rhel

echo "setting password" >> /root/post-run.log
echo redhat | passwd --stdin rhel


sed -i 's/ClientAliveInterval.*900//g' /etc/ssh/sshd_config
sed -i '/\[rhel-9-for-x86_64-baseos-rpms\]/,/^ *\[/ s/gpgcheck = 1/gpgcheck = 0/' /etc/yum.repos.d/redhat.repo
hostnamectl set-hostname rhel-$(uuidgen | cut -c 32-)
sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
exec $SHELL

