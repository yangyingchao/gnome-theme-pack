#!/bin/bash
#
# Author: Yang,Ying-chao <yangyingchao@gmail.com>, 2017-01-16
#

die() {
    set +x
    local IFS=$' \t\n'
    set +e

    echo -e "$@" | while read -r ; do
        echo " $BAD*$NORMAL $RC_INDENTATION$REPLY" >&2
    done
    exit 1
}

TOP=${PWD}

if [ -f "gnome-terminal/gnome-terminal-theme.sh" ]; then
    bash gnome-terminal/gnome-terminal-theme.sh
    if [ $? -ne 0 ]; then
        die "failed to install gnome-terminal-theme."
    fi
else
    die "gnome-terminal-theme.sh is missing"
fi

echo "yes" | emerge -av gnome-shell-extensions-topicons

cd numix-gtk-theme/ && sudo make install

cd ${TOP}

cd extensions

cd pixel-saver

[ -f ~/.local/share/gnome-shell/extensions/pixel-saver@deadalnix.me ] ||  ln -sf ${PWD}/pixel-saver@deadalnix.me ~/.local/share/gnome-shell/extensions/
