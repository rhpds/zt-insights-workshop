#!/bin/bash

# Unregister and register the VM
subscription-manager clean
subscription-manager register --activationkey=12-5-22-instruqt --org=12451665 --force

hostnamectl set-hostname rhel-$(uuidgen | cut -c 32-)
