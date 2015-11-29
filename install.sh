#!/bin/sh

if [ "$(id -u)" == "0" ]; then
    echo "This script must be run as a regular user with sudo rights" 1>&2
    exit 1
fi

if [ "$(which sudo)" == "" ]; then
    echo "This script needs the sudo program installed in the system" 1>&2
    exit 2
fi

echo "Copying the following system configuration files:"
find sysfiles -type f -exec echo \ · {} \;
sudo scripts/replicant.sh sysfiles

echo "Going to install $(grep -v "^#" packages/system-packages | grep . | wc -l) system packages: "
scripts/install.sh packages/system-packages

echo "Going to install $(grep -v "^#" packages/user-packages | grep . | wc -l) user packages: "
scripts/install.sh packages/user-packages

echo "Configuring the system: "
sudo scripts/configure.sh

echo "Configuring the user: "
scripts/user-configure.sh
