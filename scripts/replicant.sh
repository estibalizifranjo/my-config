#!/bin/sh

DSTDIR=

if [ "$#" == "0" ]; then
  exit -1
fi

unset DRY_RUN

if [ "$1" == "-h" ]; then
  echo -e "Replicates the folder struture in ${DSTDIR}/"
  echo -e "\t$0 [-n] <folder to replicate>"
  exit 0
elif [ "$1" == "-n" ]; then
  DRY_RUN=echo
fi

for ARG in "$@"; do
  if [ ! -d ${ARG} ]; then
    continue
  fi

  # Replicate de folder structure
  for FOLDER in $(find "${ARG}" -mindepth 1 -type d | sed -e "s?${ARG}?${DSTDIR}?"); do
    ${DRY_RUN} mkdir -p ${FOLDER}
  done

  # Replicate de file structure
  for FILE in $(find "${ARG}" -mindepth 1 -type f); do
    ${DRY_RUN} cp -i ${FILE} $(echo ${FILE} | sed "s?${ARG}?${DSTDIR}?")
  done
done
