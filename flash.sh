#!/bin/bash

# Successful flash
# md5sum 1bc19e15552ee88600a667025b58896f
FW_FILE=/vagrant/files/wzrhpg300nh-pro-v24sp2-14998b/wzrhpg300nh-pro-v24sp2-14998b.enc

curl -T $FW_FILE tftp://192.168.11.1
