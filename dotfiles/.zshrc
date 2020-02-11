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

color_file=$HOME/Repos/PersonalFiles/dotfiles/colors
eval "$(dircolors $color_file)"

##################################################################################################################
#Create aliases
alias expcode='cd /Volumes/labshare/Experiments/Gerardo'
alias personalcode='cd $HOME/Repos/PersonalFiles'

alias matlab='/Applications/MATLAB_R2019a.app/bin/matlab -nosplash -nodesktop'
alias tmux='tmux -f $HOME/Repos/PersonalFiles/dotfiles/.tmuxMySetup.conf' #run customized tmux
alias grep='grep -n --color -i'
alias ls='ls -B --group-directories-first --color=always'
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

