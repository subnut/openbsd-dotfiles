#!/bin/sh
cd "$(dirname "$0")"

install()
{
        cp -rv home/subnut "$(dirname "$HOME")"
        if test $(uname) = OpenBSD
        then
                (cd $HOME; ln -s .xinitrc .xsession; rm .zprofile ~/.local/bin/light)
                pkg_add -l openbsd_pkg_list
                echo 'copy root/etc to / by running -'
                echo '    cp -rv root/etc /'
                echo 'as root.'
                exit 0
        fi
}


copy()
{
        cp -v ~/.Xdefaults          home/subnut
        cp -v ~/.xinitrc            home/subnut
        cp -v ~/.gitconfig          home/subnut
        cp -v ~/.pythonrc           home/subnut
        cp -v ~/.vimrc              home/subnut

        test $(uname) = 'Linux' && \
        cp -v ~/.zprofile           home/subnut
        cp -v ~/.fzf.zsh            home/subnut
        cp -v ~/.zlogout            home/subnut
        cp -v ~/.zshrc              home/subnut
        cp -v ~/.zsh/*              home/subnut/.zsh

        cp -rv ~/.vim               home/subnut
        cp -rv ~/.config/bspwm      home/subnut/.config
        cp -rv ~/.config/sxhkd      home/subnut/.config
        cp -rv ~/.config/fontconfig home/subnut/.config
        cp -rv ~/.config/xsettingsd home/subnut/.config
        cp -rv ~/.config/zathura    home/subnut/.config

        cp -v  ~/.gtkrc-2.0         home/subnut
        cp -rv ~/.config/gtk-3.0    home/subnut/.config

        cp -rv ~/.local/bin/music   home/subnut/.local/bin
        cp -rv ~/.local/bin/mpv     home/subnut/.local/bin

        test $(uname) = 'Linux' && \
        cp -rv ~/.local/bin/light   home/subnut/.local/bin


        if [ `uname` = 'OpenBSD' ]
        then

        cp -v /etc/rc.conf.local    root/etc
        cp -v /etc/wsconsctl.conf   root/etc
        cp -v /etc/sysctl.conf      root/etc
        cp -v /etc/doas.conf        root/etc

        pkg_info -mz > openbsd_pkg_list

        fi

        for file in $(cat .gitignore)
        do
                rm -v "$file"
        done
        exit 0
}

test $# -eq 0 && copy


# vim:ts=4 et:
