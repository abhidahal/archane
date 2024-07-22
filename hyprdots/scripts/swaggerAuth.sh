#!/bin/bash

scrDir=$(dirname "$(realpath "$0")")
source "$scrDir"/globalcontrol.sh
icodir="${confDir}/dunst/icons"

type curl >/dev/null 2>&1 || {
  echo >&2 "Required curl but it's not installed. Aborting."
  exit 1
}
echo

PAYLOAD=$(eval wl-paste)

RESPONSE=$(curl -X 'POST' \
  'https://roseapi.theasteroid.tech/auth/login' \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -d "${PAYLOAD}")

TOKEN=$(echo "$RESPONSE" | grep -Po '"access_token": *\K"[^"]*"' | tr -d '"')

echo "$TOKEN"
echo ${#TOKEN}

if [ ${#TOKEN} -lt 1 ]; then
  notify-send "Swagger Auth" "Failed to copy access token to clipboard" -i "${icodir}/fail.svg"
else
  echo "$TOKEN" | wl-copy
  notify-send "Swagger Auth" "Access token copied to clipboard" -i "${icodir}/success.svg"
fi
