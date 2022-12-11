#!/usr/bin/env bash

echo "create a api service ..."
cp api.sh /etc/init.d/api_vector/api
cp api.service /etc/systemd/system
chmod +x /etc/init.d/api_vector/api
echo "created the api service"
