#!/usr/bin/env bash

INPUT=${1}
EXTENSION=${INPUT##*.}
DIR=~/Projects/eduid.cz/git/

if [ -z ${INPUT} ]; then
    echo "A metadata file missing."
    exit 1
elif [ ! -f ${INPUT} ]; then
    echo "The file ${INPUT} does not exist."
    exit 1
fi

ENTITYID=$(sed -n 's/.*entityID="\([a-zA-Z0-9:/.\-_]*\)".*/\1/p' ${INPUT})

ENTITYIDNOPREFIX=${ENTITYID##*://}
OUTPUT=${ENTITYIDNOPREFIX////%2F}.xml

echo "Registering ${ENTITYID}"
echo "Moving ${INPUT} to ${DIR}${OUTPUT}"

mv ${INPUT} ${DIR}${OUTPUT}
echo ${ENTITYID} >> ${DIR}eduid.tag

echo "---"
echo "Don't forget to add entity category if this is an IdP!"

