#!/usr/bin/env sh

help_message() {
      echo "$(basename "$0") [-h]
      Stops containers and removes containers, networks, volumes, and images


OPTIONS:
    -h  show this help text"
}

docker-compose down
echo "Done"
