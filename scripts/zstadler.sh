#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

cd $(dirname $(dirname $0))

PROJECT="${1:-planetiler-dist}"

./mvnw -DskipTests=true --projects "${PROJECT}" -Dimage.version=zstadler -am clean package jib:dockerBuild

# ./mvnw -T 1C -Pfast clean test
