#!/usr/bin/env sh

help_message() {
      echo "$(basename "$0") [-h] -- Build all services.

OPTIONS:
    -h  show this help text"
}

while getopts 'h' option; do
  case "$option" in
    h) help_message
       exit 1
       ;;
  esac
done

docker-compose up -d
echo "Done"
