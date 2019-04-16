# Source the systemd environment.d user variables
for file in ${HOME}/.config/environment.d/*.conf; do
    source "${file}"
done
