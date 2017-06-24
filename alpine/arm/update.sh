#!/bin/sh

set -e

if [ $# -eq 0 ] ; then
	echo "Usage: ./update.sh <traefik tag or branch>"
	exit
fi

export VERSION=$1

# cd to the current directory so the script can be run from anywhere.
cd `dirname $0`

echo "Updating Dockerfile.aarch64 and Dockerfile.aarch32..."
export TRAEFIK_BINARY="traefik_linux-arm64"
export CONTAINER_IMAGE="arm64v8/alpine:3.5"
envsubst < ./Dockerfile.tmpl > ./Dockerfile.aarch64
TRAEFIK_BINARY="traefik_linux-arm"
CONTAINER_IMAGE="arm32v6/alpine:3.5"
envsubst < ./Dockerfile.tmpl > ./Dockerfile.aarch32
