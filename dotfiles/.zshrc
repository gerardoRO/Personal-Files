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

eval 'dircolors -b  ~/Repos/PersonalFiles/dotfiles/.dircolors > /dev/null'
alias grep='grep -n'
alias ls="ls -B -I \"NTUSER*\" -I \"ntuser*\" --color=auto"

##################################################################################################################
#Create aliases
alias workhome='cd C:/Users/Pooja'
alias ProcessingCode='cd C:/Users/Pooja/Documents/MATLAB/SONICLab/ProcessingCode'
alias mytmux='tmux -f ~/Repos/PersonalFiles/dotfiles/.tmuxMySetup.conf' #run customized tmux

##################################################################################################################
#Add to Path
PATH=/cygdrive/c/Users/Gerardo/AppData/Local/Programs/Python/Python36-32:$PATH

##################################################################################################################
#Add function file

source $HOME/Repos/PersonalFiles/dotfiles/.zshrc_functions

