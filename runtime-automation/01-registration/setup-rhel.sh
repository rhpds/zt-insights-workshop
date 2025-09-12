#!/bin/sh
echo "Starting module called 01-registration" >> /tmp/progress.log

KATELLO=$(rpm -qa | grep katello-ca)

rpm -e $KATELLO
subscription-manager clean
