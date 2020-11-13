#!/usr/bin/env sh

help_message() {
      echo "$(basename "$0") [-h] SERVICE -- This will create a new Bash session in a given container.

OPTIONS:
    SERVICE set the service name (default: php)
    -h  show this help text"
}

while getopts 'h' option; do
  case "$option" in
    h) help_message
       exit 1
       ;;
  esac
done

BASEDIR="${PWD##*/}"
SERVICE="php"
if [ ! -z "$1" ]; then
SERVICE=$1
fi

CONTAINER_NAME="${BASEDIR}_${SERVICE}_1";

if [ ! "$(docker ps -q -f name="${CONTAINER_NAME}"$)" ]; then
  echo "Container $CONTAINER_NAME does not exist"
  exit 0
fi

echo "Execute container $CONTAINER_NAME"
docker exec -it "$CONTAINER_NAME" bash
