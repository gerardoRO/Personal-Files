#################################################################################################################
#Set environment variables
export PATH=$PATH:/$HOME/.local/bin #add local path that control pip location
export ZSH=~/.oh-my-zsh
export EDITOR= 'emacs'

# Shell Theme
ZSH_THEME="mytheme"

#zshell plugings
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

##################################################################################################################
#Create aliases
alias personalcode='cd $HOME/Repos/PersonalFiles'


alias matlab='/Applications/MATLAB_R2019a.app/bin/matlab -nosplash -nodesktop'
alias tmux='tmux -f $HOME/Repos/PersonalFiles/dotfiles/.tmuxMySetup.conf' #run customized tmux
alias grep='grep -n --color -i'
alias emacs='emacs -nw' #run emacs without calling X11 system

LS_COLORS='di=0;35:';export LS_COLORS
##################################################################################################################
#Add function file
source $HOME/Repos/PersonalFiles/dotfiles/.zshrc_functions

##Variables necessary for virtualenvwrapper.sh
WORKON_HOME=$HOME/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=$(which python3)
export WORKON_HOME
export VIRTUALENVWRAPPER_PYTHON

export PYTHONSTARTUP=~/.pythonrc
##################################################################################################################
#Processes  needed to run virtual environment
source $HOME/.local/bin/virtualenvwrapper.sh

##################################################################################################################
# Necessary to show python figures in WSL
export DISPLAY=localhost:0.0
alias charm="/mnt/c/Program\ Files/JetBrains/PyCharm\ Community\ Edition\ 2020.1.1/bin/pycharm64.exe"


tmux

