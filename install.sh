#!/bin/bash

check_command () {
	if ! command -v $1 2>&1 > /dev/null; then
		echo "$1 is not installed"
		exit 1
	fi
}

check_command "curl"
check_command "git"

echo "Installing plugins"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
	echo "Installing zsh-syntax-highlighting"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
	echo "Installing zsh-autosuggestions "
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi


# if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete ]; then
# 	echo "Installing zsh-autocomplete"
#     git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
# fi

if [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
	echo "backing up ~/.zshrc to ~/.zshrc.bak"
	mv "~/.zshrc"  "~/.zshrc.bak"
fi


if [ ! -L ~/.zshrc ]; then
	echo "Creating symlink for .zshrc"
	ln -s "$PWD/.zshrc" ~/.zshrc
fi


if [ ! -d ~/.config/tmux ]; then
    mv -f ~/.config/tmux ~/.config/tmux.bak
    echo "xd"
    ln -s "$PWD/tmux" ~/.config/tmux
fi
