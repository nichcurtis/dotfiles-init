#!/usr/bin/env bash

hash zsh 2>/dev/null || {
    echo >&2 "Zsh is not installed. Aborting."
    exit 1
}

if [ ! -d ~/.homesick/repos/homeshick ]; then
    echo "Installing Homeshick."
    git clone https://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
fi

source ~/.homesick/repos/homeshick/homeshick.sh
homeshick link homeshick

if [ ! -d ~/.homesick/repos/prezto ]; then
    echo "Installing Prezto."
    homeshick clone sorin-ionescu/prezto
fi

if [ ! -d ~/.homesick/repos/dotfiles ]; then
    echo "Installing dotfiles."
    homeshick clone CWSpear/dotfiles
fi

ZSH=`which zsh`

if [ $ZSH != $SHELL ]; then
    echo "Changing shell to Zsh."
    chsh -s $ZSH
fi

echo "Prezto and Zsh installed. Open a new terminal window or tab and enjoy"
