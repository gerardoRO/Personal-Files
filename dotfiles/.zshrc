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
alias ProcessingCode='cd C:/Users/Pooja/Documents/MATLAB/SONICLab/ProcessingCode'
alias tmux='tmux -f $HOME/Repos/PersonalFiles/dotfiles/.tmuxMySetup.conf' #run customized tmux
alias grep='grep -n'
##################################################################################################################
#Add function file

source $HOME/Repos/PersonalFiles/dotfiles/.zshrc_functions
tmux
