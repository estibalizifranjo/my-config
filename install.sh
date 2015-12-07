#!/bin/sh

if [ "$(id -u)" == "0" ]; then
    echo "This script must be run as a regular user with sudo rights" 1>&2
    exit 1
fi

if [ "$(which sudo)" == "" ]; then
    echo "This script needs the sudo program installed in the system" 1>&2
    exit 2
fi

find sysfiles -type f -exec echo \ · {} \;
echo -n "Want to update the above system configuration files? (yes/no) "
read RESULT
if [[ ${RESULT} == "yes" ]]; then
  sudo scripts/replicant.sh sysfiles
fi

for FILE in packages/*; do
  echo -n "Want to install $(grep -v "^#" ${FILE} | grep . | wc -l) packages from ${FILE} file? (yes/no) "
  read RESULT
  if [[ ${RESULT} == "yes" ]]; then
    scripts/install.sh ${FILE}
  fi
done

echo -n "Want to update your system configuration? (yes/no) "
read RESULT
if [[ ${RESULT} == "yes" ]]; then
  sudo scripts/configure.sh
fi

echo -n "Want to update your user configuration? (yes/no) "
read RESULT
if [[ ${RESULT} == "yes" ]]; then
  scripts/user-configure.sh
fi

echo "Finally, stow all configurations"
cd dotfiles
for FILE in *; do
  echo -n "Stow ${FILE}? (yes/no) "
  read RESULT
  if [[ ${RESULT} == "yes" ]]; then
    stow -t ~ ${FILE}
  fi
done

echo "All done"
