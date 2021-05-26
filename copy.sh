#!/bin/sh
cd "$(dirname "$0")"

pkg_info -m \
        | grep -Ev '(amdgpu|iwm|uvideo|vmm)-firmware|^quirks-|^portslist-' \
        > installed_pkg_list

cp -v /etc/wsconsctl.conf   root/etc
cp -v /etc/sysctl.conf      root/etc
cp -v /etc/doas.conf        root/etc

cp -v ~/.Xdefaults          home/subnut
cp -v ~/.xsession           home/subnut
cp -v ~/.vimrc              home/subnut
cp -v ~/.fzf.zsh            home/subnut
cp -v ~/.zshrc              home/subnut
cp -v ~/.zsh/*              home/subnut/.zsh

cp -rv ~/.config/bspwm      home/subnut/.config
cp -rv ~/.config/fontconfig home/subnut/.config
cp -rv ~/.config/xsettingsd home/subnut/.config

cp -rv ~/.local/bin/music   home/subnut/.local/bin

# vim:ts=4 et:
