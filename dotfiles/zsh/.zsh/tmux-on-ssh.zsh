if [[ -z "$TMUX" && -n "$SSH_CONNECTION" ]] && which tmux >& /dev/null; then
  exec tmux new -A -s ssh
fi

