#!/usr/bin/env bash

set -e
echo "" > lcov.info

for d in $(go list ./... | grep -v vendor); do
    go test -coverprofile=profile.info -coverpkg=github.com/json-iterator/go $d
    if [ -f profile.out ]; then
        cat profile.out >> lcov.info
        rm profile.out
    fi
done
