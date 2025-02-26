#!/bin/bash
rm -rf /var/log/xray/access.log
systemctl restart xray
