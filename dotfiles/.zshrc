# Path to your oh-my-zsh installation.
  export ZSH=/home/Gerardo/.oh-my-zsh
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

eval 'dircolors ~/dotfiles/.dircolors > /dev/null'

alias ls="ls --color";

##################################################################################################################

#Create aliases
alias mytmux='tmux -f ~/dotfiles/.tmuxMySetup.conf attach' #run customized tmux


##################################################################################################################
#Customize the prompt


##################################################################################################################

#Add anaconda to my path
PATH=/cygdrive/c/Users/gerar/Anaconda3/Scripts:$PATH



##################################################################################################################

#Function to run Matlab scripts from the command prompt
matlabRun(){
    matlab -nodisplay -nosplash -nodesktop -r "try, run('$1');, catch, exit(1), end, exit(0)";
    echo -e " --- 1 (error) ---- 0 (complete)\n Matlab Error Code: ($?)";

};

##################################################################################################################

#Function to run google with a parameter
#googleFunc(){}
    #'/c/Program Files (x86)/Google/Chrome/Application/chrome.exe'
 # echo ''  
#}
