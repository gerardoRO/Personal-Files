##################################################################################################################
#Set environment variables
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
alias expcode='cd /Volumes/labshare/Experiments/Gerardo'
alias labcode='cd $HOME/Repos/SonicLab'
alias personalcode='cd $HOME/Repos/PersonalFiles'
alias processingcode='cd C:/Users/Pooja/Documents/MATLAB/SONICLab/ProcessingCode'

alias matlab='/Applications/MATLAB_R2019a.app/bin/matlab -nosplash -nodesktop'
alias tmux='tmux -f $HOME/Repos/PersonalFiles/dotfiles/.tmuxMySetup.conf' #run customized tmux
alias grep='grep -n --color -i'
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
#Processes needed only at work
source /usr/local/bin/virtualenvwrapper.sh

tmux

