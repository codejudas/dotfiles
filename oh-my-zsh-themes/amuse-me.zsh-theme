# vim:ft=zsh ts=2 sw=2 sts=2

rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}

python_version() {
  python --version 2>&1 | awk '{print $2}'
}

display_venv() {
  # Check if the current directory running via Virtualenv
  [ -n "$VIRTUAL_ENV" ] || return

  echo "[$(basename $VIRTUAL_ENV)@$(python_version)] "
  return
}

TIME_PROMPT='⌚ %{$fg_bold[red]%}%*%{$reset_color%}'
VENV_PROMPT='%{$fg[blue]%}$(display_venv)%{$reset_color%}'

PROMPT='
'$TIME_PROMPT' %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) '$VENV_PROMPT'
$ '

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

if [ -e ~/.rvm/bin/rvm-prompt ]; then
  RPROMPT='%{$fg_bold[red]%}‹$(rvm_current)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
  fi
fi

