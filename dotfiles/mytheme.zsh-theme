local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

git_custom_prompt() {
    if [[ -n $(current_branch) ]]; then
	echo "%{[$(current_branch)$(parse_git_dirty)]%}"
    fi
}


PROMPT='
$fg[cyan]%c: %{$fg[red]%}%{$(git_custom_prompt)%}%{$reset_color%}
%{$reset_color%}>> '

RPROMPT='%{$fg[yellow]%}$HOST%{$reset_color%} ${returncode}'

