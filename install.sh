#!/bin/sh

if [ "$(id -u)" == "0" ]; then
    echo "This script must be run as a regular user with sudo rights" 1>&2
    exit 1
fi

if [ "$(which sudo)" == "" ]; then
    echo "This script needs the sudo program installed in the system" 1>&2
    exit 2
fi

for FILE in packages/*; do
  echo -n "Want to install $(grep -v "^#" ${FILE} | grep . | wc -l) packages from ${FILE} file? (yes/no) "
  read RESULT
  if [[ ${RESULT} == "yes" ]]; then
    scripts/install.sh ${FILE}
  fi
done

echo -n "Finally, wanna stow user configurations? (yes/no) "
read RESULT
if [[ ${RESULT} == "yes" ]]; then
  dotfiles/.bin/stowsh -s -t ~ dotfiles 
fi

echo "All done"
