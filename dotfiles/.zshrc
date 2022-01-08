#################################################################################################################
#Set environment variables
export PATH=$PATH:$HOME/.local/bin #add local path that control pip location
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

if [[ "$(uname)"=="Linux" ]]; then
    #    alias matlab='/usr/local/MATLAB/R2020a/bin/matlab -nosplash -nodesktop'
fi
if [[ "$(uname)"=="Darwin" ]]; then
    alias matlab='/Applications/MATLAB_R2019a.app/bin/matlab -nosplash -nodesktop'
fi
   


alias tmux='tmux -f $HOME/Repos/PersonalFiles/dotfiles/.tmuxMySetup.conf' #run customized tmux
alias grep='grep -n --color -i'
alias emacs='emacs -nw' #run emacs without calling X11 system

alias gerardo='cd /mnt/c/Users/Gerardo'
alias geraphonics='cd /mnt/c/Users/Gerardo/Documents/MATLAB/SONICLab/GeraPhonics/'
alias map_andrew='sudo mount -t drvfs M: /mnt/m'
alias andrewfiles='cd /mnt/m/Experiments/Gerardo'
alias map_sonic='sudo mount -t drvfs Z: /mnt/z'
alias sonicfiles='cd /mnt/z/'
alias quicknote='emacs ~/Repos/Notes/notes.org'
alias jupyter='jupyter-notebook --no-browser --certfile=/mnt/c/Users/Gerardo/mycert.pem --keyfile /mnt/c/Users/Gerardo/mykey.key'
alias secondwave='cd /mnt/e/SecondWave'
alias passwords='emacs /mnt/d/Data\ Backup/Oficial\ Documents/passwords.org'


#alias jupyter-colab='jupyter-notebook --no-browser --NotebookApp.allow_origin=\"https://colab.research.google.com\" --port=2841 --NotebookApp.port_retries=0 --NotebookApp.password='' --NotebookApp.token='''
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
#Processes  needed to run virtual environment
source /usr/local/bin/virtualenvwrapper.sh

##################################################################################################################
# Necessary to show python figures in WSL
#export DISPLAY=localhost:0.0 in WSL1

export DISPLAY=192.168.1.38:0
export LIBGL_ALWAYS_INDIRECT=1

#Functioning with CUDA
export PATH=$PATH:/usr/local/cuda-11.0/lib64/bin
export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

tmux
LS_COLORS='di=0;35:ow=0;35:';export LS_COLORS
