#For managing virtual environments via bash
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source C:/Users/Gerardo/AppData/Local/Programs/Python/Python310/Scripts/virtualenvwrapper.sh


## For organizing the terminal prompt
#Git Stuff
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

git_custom_branch() {
    if [[ -n $(parse_git_branch) ]]; then
        echo "$(parse_git_branch)"
    fi
}

#virtual environment stuff
virtual_env_custom_prompt() {
    if [[ -n $VIRTUAL_ENV ]]; then
      echo "[$(basename $VIRTUAL_ENV)]"
    fi
}

export PS1='\[\033[2;33m\]$(virtual_env_custom_prompt)\[\033[00m\]\[\033[1;36m\]$(git_custom_branch)\[\033[00m\]  \[\033[1;32m\]\W\[\033[00m\] ::'
export VIRTUAL_ENV_DISABLE_PROMPT=1