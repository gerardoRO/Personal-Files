
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

git_custom_prompt() {
    if [[ -n $(current_branch) ]]; then
	echo "%{[$(current_branch)$(parse_git_dirty)]%}"
    fi
}


virtual_env_custom_prompt() {
    if [[ -n $VIRTUAL_ENV ]]; then
       echo " %{$fg[yellow]%}[${VIRTUAL_ENV##*/}]%{$reset_color%} "
    fi
}
export VIRTUAL_ENV_DISABLE_PROMPT=1



PROMPT='
$fg[cyan]%c:%{$fg[red]%}%{$(git_custom_prompt)%}%{$reset_color%}
%{$reset_color%}:: '


RPROMPT='$(virtual_env_custom_prompt)'
##RPROMPT='%{$fg[yellow]%}$HOST%{$reset_color%} ${returncode}'

