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
tmux

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

    alias cyg-conda=${CONDA_BASE_DIR}/Scripts/conda.exe
    cyg-activate() {
	export CONDA_DEFAULT_ENV=$1
	source ~/.zshrc
	cyg-conda info --envs
    }

    PATH=$PATH:$CONDA_PREFIX
    PATH=$PATH:$CONDA_PREFIX/Library/mingw-w64/bin
    PATH=$PATH:$CONDA_PREFIX/Library/usr/bin
    PATH=$PATH:$CONDA_PREFIX/Library/bin
    PATH=$PATH:$CONDA_PREFIX/Scripts
    PATH=$PATH:$HOME/scripts
    PATH=$PATH:$HOME/local/bin
    PATH=$PATH:/usr/local/bin
    PATH=$PATH:/usr/bin

    export PATH
    
fi


