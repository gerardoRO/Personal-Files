#!/bin/zsh


#if test ! $(apt-cyg);then
#    wget -qo "/bin/apt-cyg https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg"
#    chmod +ax /bin/apt-cyg
#fi


PACKAGES=(
    zsh
    emacs
    git
    curl
    tmux
    python3-pip
    python3
    ipython
)

echo "installing packages"
apt-cyg install ${PACKAGES[@]}


PYTHON_PACKAGES=(
    matplotlib
    pyplot
    pandas
    numpy
    scipy
    keras
    theanos
    tensorflow
    nltk
    statsmodels
)

sudo pip install ${PYTHON_PACKAGES[@]}

if [[ ! -d ~/.oh-my-zsh ]] ;then
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o -)"
ln -fs ~/mytheme* ~/.oh-my-zsh/themes/mytheme.zsh-theme
fi

if [[ ! -d ~/Repos/PersonalFiles ]] ;then
    git clone https://github.umn.edu/rodr0283/PersonalFiles ~/Repos/PersonalFiles
    ln -fs ~/Repos/PersonalFiles/dotfiles/.* .
    ln -fs ~/Repos/PersonalFiles/dotfiles/* .
fi


source ./zshrc
