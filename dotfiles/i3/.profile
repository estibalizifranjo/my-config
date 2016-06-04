if [ "$0" = "/etc/lightdm/Xsession" -a "$DESKTOP_SESSION" = "i3" ]; then
    export $(gnome-keyring-daemon -s)
fi
