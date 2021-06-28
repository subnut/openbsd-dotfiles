#!/bin/sh
cd "$(dirname "$0")"

# On a new machine, simply run -
#   pkg_add -l installed_pkg_list
pkg_info -mz > installed_pkg_list

cp -v /etc/rc.conf.local    root/etc
cp -v /etc/wsconsctl.conf   root/etc
cp -v /etc/sysctl.conf      root/etc
cp -v /etc/doas.conf        root/etc

cp -v ~/.Xdefaults          home/subnut
cp -v ~/.xsession           home/subnut
cp -v ~/.vimrc              home/subnut
cp -v ~/.gitconfig          home/subnut

cp -v ~/.pythonrc           home/subnut
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

# vim:ts=4 et:
