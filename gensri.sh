#!/usr/bin/env bash

if [ -z ${1} ]; then
    echo "A file argument missing."
    exit 1
elif [ ! -f ${1} ]; then
    echo "The file ${1} does not exist."
    exit 1
fi

FILE=${1}
EXTENSION=${FILE##*.}

SHA256=`openssl dgst -sha256 -binary ${FILE} | openssl base64 -A`
SHA384=`openssl dgst -sha384 -binary ${FILE} | openssl base64 -A`
SHA512=`openssl dgst -sha512 -binary ${FILE} | openssl base64 -A`

SRI="sha256-${SHA256} sha384-${SHA384} sha512-${SHA512}"

if [ ${EXTENSION} == "js" ]; then
    echo '<script async|defer src="..../'${FILE}'" integrity="'${SRI}'"></script>'
elif [ ${EXTENSION} == "css" ]; then
    echo '<link rel="stylesheet" href="..../'${FILE}'" integrity="'${SRI}'" crossorigin="anonymous">'
else
    echo "Only CSS and JavaScript files supported."
    exit 1
fi

