#!/usr/bin/env bash

if [ -r ~/smime.p7s ]; then
    openssl pkcs7 -in smime.p7s -inform DER -print_certs
    openssl x509 -text
    rm -i ~/smime.p7s
else
    echo "No readable ~/smime.p7s file found."
fi

