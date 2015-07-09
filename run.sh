#!/bin/bash
cp config/secrets.yml.example config/secrets.yml
sed -i "s/local.anomi.net:9393/$API_PORT_8080_TCP_ADDR:8080/" config/secrets.yml
bundle exec puma
