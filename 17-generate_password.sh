#!/bin/bash


LENGTH=$1

if [ -z "$LENGTH" ]; then
  echo "Usage: $0 <password-length>"
  exit 1
fi

CHARS='A-Za-z0-9!@#$%^&*()_+='

password=$(tr -dc "$CHARS" < /dev/urandom | head -c "$LENGTH")
echo "Generated password: $password"

