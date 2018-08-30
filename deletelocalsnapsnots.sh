#!/usr/bin/env bash

SYSTEM="Darwin"

if [[ `uname -s` == "${SYSTEM}" ]]; then
    for i in `tmutil listlocalsnapshots / | cut -d'.' -f4-`; do sudo tmutil deletelocalsnapshots $i; done
else
    echo "This is `uname -s`, not ${SYSTEM}."
fi

