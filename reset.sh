#!/usr/bin/env sh

help_message() {
      echo "$(basename "$0") [-h]
      Stops containers and removes containers, networks, volumes, and images.
      Remove all unused containers, networks, images, and optionally, volumes.
      Remove build cache.


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

docker-compose down -v && \
docker system prune -a --force && \
docker builder prune --force
echo "Done"

if ! command -v osascript &> /dev/null
then
    echo "osascript could not be found"
    exit 1
fi

if ! command -v open &> /dev/null
then
    echo "open could not be found"
    exit 1
fi

osascript -e 'quit app "Docker"' && \
open --background -a Docker && \
echo "Please wait until Docker for Mac is restarted."
