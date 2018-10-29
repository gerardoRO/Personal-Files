local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

git_custom_prompt() {
    if [[ -n $(current_branch) ]]; then
	echo "%{[$(current_branch)$(parse_git_dirty)]%}"
    fi
}


virtual_env_custom_prompt() {
    if [[ -n $VIRTUAL_ENV ]]; then
       echo ${VIRTUAL_ENV##*/}
    fi
}
export VIRTUAL_ENV_DISABLE_PROMPT=1



PROMPT='
$fg[cyan]%c: %{$fg[red]%}%{$(git_custom_prompt)%}%{$reset_color%}
%{$reset_color%}:: '

RPROMPT='%{$fg[yellow]%}$HOST||$(virtual_env_custom_prompt)%{$reset_color%} ${returncode}'

