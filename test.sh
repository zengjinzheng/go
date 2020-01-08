#!/usr/bin/env bash

set -e
echo "" > ./coverage/lcov.info

for d in $(go list ./... | grep -v vendor); do
    go test -coverprofile=profile.out -coverpkg=github.com/json-iterator/go $d
    if [ -f profile.out ]; then
        cat profile.out >> ./coverage/lcov.info
        rm profile.out
    fi
done
