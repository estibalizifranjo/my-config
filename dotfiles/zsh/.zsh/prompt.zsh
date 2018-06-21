if [[ -f /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme ]]; then
  source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
else
  setopt prompt_subst
  () {
    local PR_TIME PR_USER PR_PROMPT PR_HOST

    # Check the UID
    if [[ $UID -ne 0 ]]; then # normal user
      PR_USER='%F{green}%n%f'
      PR_PROMPT='%F{green}➤%f'
    else # root
      PR_USER='%F{red}%n%f'
      PR_PROMPT='%F{red}➤%f'
    fi

    # Check if we are on SSH or not
    if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
      PR_HOST='%F{magenta}%M%f' # SSH
    else
      PR_HOST='%F{blue}%M%f' # no SSH
    fi

    local return_code="%(?..%F{red}%? ↵%f)"
    local user_host="${PR_USER}%F{white} at ${PR_HOST}"
    local current_dir="%F{cyan}%~%f"
    local git_branch='$(git_prompt_info)'
    local current_time='%F{yellow}%*%f'

    PROMPT="%F{white}╭─ ${current_time}%F{white}, ${user_host}%F{white} in ${current_dir} ${git_branch}
%F{white}╰──$PR_PROMPT "
    RPROMPT="${return_code}"

    ZSH_THEME_GIT_PROMPT_PREFIX="%F{white}on %F{magenta}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
    ZSH_THEME_GIT_PROMPT_DIRTY="*"
  }
fi
