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
export LabCode=$HOME/Repos/SonicLab
export PersonalCode=$HOME/Repos/PersonalFiles
export ProcessingCode=C:/Users/Pooja/Documents/MATLAB/SONICLab/ProcessingCode

alias tmux='tmux -f $HOME/Repos/PersonalFiles/dotfiles/.tmuxMySetup.conf' #run customized tmux
alias grep='grep -n --color -i'
##################################################################################################################
#Add function file

source $HOME/Repos/PersonalFiles/dotfiles/.zshrc_functions

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

#    alias cyg-conda=${CONDA_BASE_DIR}/Scripts/conda.exe
#    alias conda-env=${CONDA_BASE_DIR}/Scripts/conda-env.exe
#    alias activate=${CONDA_BASE_DIR}/Scripts/activate
#    alias deactivate=${CONDA_BASE_DIR}/Scripts/deactivate
#    cyg-activate() {
#	export CONDA_DEFAULT_ENV=$1
#	source ~/.zshrc
#	export VIRTUAL_ENV=$1
#    }
#
#    cyg-deactivate(){
#	export CONDA_DEFAULT_ENV= root
#	export CONDA_PREFIX=${CONDA_BASE_DIR}
#	source ~/.zshrc
#    }
#
#    PATH=
#    PATH=$PATH:$CONDA_PREFIX
#    PATH=$PATH:$CONDA_PREFIX/Library/mingw-w64/bin
#    PATH=$PATH:$CONDA_PREFIX/Library/usr/bin
#    PATH=$PATH:$CONDA_PREFIX/Library/bin
#    PATH=$PATH:$CONDA_PREFIX/Scripts
#    PATH=$PATH:$HOME/scripts
#    PATH=$PATH:$HOME/local/bin
#    PATH=$PATH:/usr/local/bin
#    PATH=$PATH:/usr/bin
#
#    export PATH
#
#    
#    . c:/users/pooja/Anaconda3/etc/profile.d/conda.sh
fi

##Variables necessary for virtualenvwrapper.sh
WORKON_HOME=$HOME/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=$(which python3)
export WORKON_HOME
export VIRTUALENVWRAPPER_PYTHON

source /bin/virtualenvwrapper.sh


tmux

