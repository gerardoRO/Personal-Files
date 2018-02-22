function get_pwd() {
echo "${PWD/$HOME/~}"
}

function get_git() {

}

PROMPT='
$fg[cyan]$HOST: $fg[yellow]$(get_pwd)
$reset_color>>  '

RPROMPT=

git_custom_prompt() {

local branch = #(current_branch)

if [ -n "$branch" ]; then

echo "$(parse-git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$branch$ZSH_THEME_GIT_PROMPT_SUFFIX"

fi
}