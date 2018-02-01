# vim:ft=zsh ts=2 sw=2 sts=2

python_version() {
  python --version 2>&1 | awk '{print $2}'
}

display_venv() {
  # Check if the current directory running via Virtualenv
  [ -n "$VIRTUAL_ENV" ] || return

  VENV_DIR=`python -c "import os; print(os.environ['VIRTUAL_ENV'].split('/')[-2])"`
  echo "[$VENV_DIR@$(python_version)] "
  return
}

display_aws_realm() {
  [ -n "$AWS_REALM" ] || return

  echo "[aws: $AWS_REALM] "
  return
}

TIME_PROMPT='⌚ %{$fg_bold[red]%}%*%{$reset_color%}'
VENV_PROMPT='%{$fg[blue]%}$(display_venv)%{$reset_color%}'
AWS_PROMPT='%{$fg[red]%}$(display_aws_realm)%{$reset_color%}'

PROMPT='
'$TIME_PROMPT' %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) '$VENV_PROMPT$AWS_PROMPT'
$ '

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
