#!/bin/zsh

#Determine OS type
case $(uname) in
    Linux)
	alias install_stuff='apt-get install'
    ;;
    CYGWIN*)
	if [ ! -x /bin/apt-cyg ];then
	    wget "https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg" && mv apt-cyg /bin/apt-cyg
	    chmod +x /bin/apt-cyg
	fi

	alias install_stuff='apt-cyg install'
    ;;
    Darwin)
	if [ ! -x /bin/brew ];then
	    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Hombrew/install/master/install)"
	fi
	
	alias install_stuff='brew install'
	brew install caskroom/cask/brew-cask

	CASKS=(
	    dropbox
	    google-chorme
	    google-drive
	    gpgtools
	    iterm2
	    skype
	    virtualbox
	    vlc
	)
	brew cask install ${CASKS[@]}
    ;;
esac

## terminal packages to install

PACKAGES=(
    emacs
    git
    curl
    tmux
    python3
    python3-pip
)

echo "installing packages"
install_stuff ${PACKAGES[@]}


## Python packages to import 

PYTHON_PACKAGES=(
    virtualenv
    numpy
)

python3 -m pip install --upgrade pip
pip3 install ${PYTHON_PACKAGES[@]}


## Clone my github repository, fetch oh-my-zsh and load my theme

if [[ ! -d ~/.oh-my-zsh ]] ;then
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o -)"
chmod +x install.sh
./install.sh
fi

if [[ ! -d ~/Repos/PersonalFiles ]] ;then
    git clone https://github.umn.edu/rodr0283/PersonalFiles $HOME/Repos/PersonalFiles
    ln -fs $HOME/Repos/PersonalFiles/dotfiles/.minttyrc $HOME/
    ln -fs $HOME/Repos/PersonalFiles/dotfiles/.zsh* $HOME/
    ln -fs $HOME/Repos/PersonalFiles/dotfiles/mytheme* $HOME/.oh-my-zsh/themes/
    
    git config --global user.email gerarodore@hotmail.com
    git config --global user.name Gerardo
fi



source ./.zshrc
