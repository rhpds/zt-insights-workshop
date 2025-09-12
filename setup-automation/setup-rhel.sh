#!/bin/bash
hostnamectl set-hostname rhel-$(uuidgen | cut -c 32-)
