#!/usr/bin/env bash

SYSTEM="Darwin"

if [[ `uname -s` == "${SYSTEM}" ]]; then
    tmutil listlocalsnapshots /
else
    echo "This is `uname -s`, not ${SYSTEM}."
fi

