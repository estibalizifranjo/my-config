#!/bin/sh

PACMAN=$(type -p pacman)
AURHELPER=$(type -p pikaur)

if [ ! -f ${PACMAN} ]; then
  echo "Wrong packet manager, sorry."
  exit -1
fi

if [ "$#" == "0" ]; then
  echo "Provide some installation files"
  exit -2
fi

echo " ### First, update the system"
if [ -f "${AURHELPER}" ]; then
  ${AURHELPER} -Syua --noconfirm
else
  sudo pacman -Suy --noconfirm
fi

if [ $? != "0" ]; then
  exit -3
fi

for FILE in "$@"; do
  echo " ### Going to install packages in \"${FILE}\""
  if [ -f "${AURHELPER}" ]; then
    ${AURHELPER} -S --needed --noconfirm $(grep -v '^#' ${FILE} | tr '\n' ' ')
  else
    sudo pacman -S --needed --noconfirm $(grep -v '^#' ${FILE} | grep -v "^aur/" | tr '\n' ' ')
  fi
  if [ $? != "0" ]; then
    exit -4
  fi
done

