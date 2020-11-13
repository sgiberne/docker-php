#!/usr/bin/env sh

help_message() {
      echo "$(basename "$0") [-h]
      Stop and remove all running container


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

docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
echo "Done"
