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
alias LabCode='cd $HOME/Repos/SonicLab'
alias PersonalCode='cd $HOME/Repos/PersonalFiles'
alias GroceryCode='cd $HOME/Repos/PythonProjects/Grocery_Store_Projects'
alias ProcessingCode='cd C:/Users/Pooja/Documents/MATLAB/SONICLab/ProcessingCode'
alias LabData='cd /Volumes/Gerardo\ Files'

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

if [[ $HOST == 'BME-LIMGRAD7' ]]; then
    export CONDA_BASE_DIR=/cygdrive/c/Users/Pooja/Anaconda3 #create home directory

    if [ ${CONDA_DEFAULT_ENV} ] && [ ${CONDA_DEFAULT_ENV} != 'root' ]; then
	export CONDA_PREFIX=${CONDA_BASE_DIR}/envs/${CONDA_DEFAULT_ENV}
    else
	export CONDA_DEFAULT_ENV=root
	export CONDA_PREFIX=${CONDA_BASE_DIR}
    fi
    source /bin/virtualenvwrapper.sh
else
    source /usr/local/bin/virtualenvwrapper.sh
fi


tmux

