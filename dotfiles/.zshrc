# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh
# Shell Theme
ZSH_THEME="mytheme"

#zshell plugings
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

[[ "$-" != *i* ]] && return
##################################################################################################################

#Read input from dircolors to incorporate the colors into ls and suppress output

eval 'dircolors ~/Repos/PersonalFiles/dotfiles/.dircolors > /dev/null'
alias ls="ls --color=always";

##################################################################################################################
#Create aliases
alias mytmux='tmux -f ~/Repos/PersonalFiles/dotfiles/.tmuxMySetup.conf attach' #run customized tmux


##################################################################################################################
#Add to Path
PATH=/cygdrive/c/Users/gerar/Anaconda3/Scripts:$PATH

##################################################################################################################
#Add function file


source $HOME/Repos/PersonalFiles/dotfiles/.zshrc_functions
