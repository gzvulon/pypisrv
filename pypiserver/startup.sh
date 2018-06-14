#!/bin/bash
cd /app/data
mkdir -p packages
exec pypi-server -v --overwrite -P .  -a . -p 8081 packages