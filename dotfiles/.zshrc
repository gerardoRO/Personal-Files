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
#Read input from dircolors to incorporate the colors into ls and suppress output

eval 'dircolors -b  ~/.dircolors > /dev/null'
alias ls="ls --color=auto"

##################################################################################################################
#Create aliases
alias mytmux='tmux -f ~/Repos/PersonalFiles/dotfiles/.tmuxMySetup.conf attach' #run customized tmux
alias tmux='tmux -f ~/Repos/PersonalFiles/dotfiles..tmuxMySetup.conf attach'

##################################################################################################################
#Add to Path
PATH=/cygdrive/c/Users/gerar/Anaconda3/Scripts:$PATH

##################################################################################################################
#Add function file

source $HOME/Repos/PersonalFiles/dotfiles/.zshrc_functions

