# Set user-defined locale
export LANG=$(locale -uU)

# This file is not read by bash(1) if ~/.bash_profile or ~/.bash_login
# exists.
#


##Installing brew files
if test ! $(which  brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

update brew

#Core GNU utilities are outdated in OSX
brew tap homebrew/dupes
brew install coreutils
brew install gnu-sed --with-default-naMes
Brew Install Gnu-tar --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-which --with-default-names
brew installn gnu-grep --with-default-names

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install brew files
PACKAGES={
    git
    emacs
    python
    tmux
    zsh
    python3
    wget
    curl
    terminal-notifier
    graphviz
    gettext
}

echo "installing brew packages..."
brew install ${PACKAGES[@])

# Installing cask files
echo "Installing cask..."
brew install caskroom/cask/brew-cask

CASKS=(
    dropbox
    firefox
    flux
    google-chrome
    google-drive
    gpgtools
    iterm2
    skype
    slack
    spectacle
    vagrant
    virtualbox
    vlc
)

# Installing python packages
echo "Installing Python packages..."
PYTHON_PACKAGES=(
    ipython
    virtualenv
    virtualenvwrapper
    ipdb
    matplotlib
    pyplot
    pandas
    send2trash
    requests
    beautifulsoup4
    selenium
    python-docx
    PyPDF2
    pyzmail
    twilio
    pillow
    scipy
    numpy
    keras
    tensorflow
    nltk
    theanos
    statsmodels
>>>>>>> 0d80b5c6c9248ddaa3c2ccee61be4f1e8b4dcb14:dotfiles/startupOSX.sh
)
sudo pip install ${PYTHON_PACKAGES[@]}


# Change to zsh and clone in all my personal files
chsh zsh

if [ ! -d ~/Repos/PersonalFiles ]; then
    git clone https://github.umn.edu/rodr0283/PersonalFiles
    ln -fs  ~/Repos/PersonalFiles/dotfiles/.* .
    ln -fs  ~/Repos/PersonalFiles/dotfiles/* .
fi

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
ln -fs ~/mytheme* ~/.oh-my-zsh/themes/mytheme.zsh-theme
source ~/.zshrc
