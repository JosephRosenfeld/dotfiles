# Load VCS Info
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '(%b)'

# ls Colors
#export CLICOLOR=1
#export LS_COLORS=GxFxCxDxBxegedabagaced
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Precmd Function
precmd() {
  # Not exactly sure, but this line is necessary for git info to show
  vcs_info
  
  # Print a newline before the prompt,
  # unless it's the first prompt in the process.
  if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
    NEW_LINE_BEFORE_PROMPT=1
    clear # Just to clear out the terminal
  elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
    echo ""
  fi
}

# Prompt
setopt PROMPT_SUBST
PROMPT='%F{cyan}%d%f %F{green}${vcs_info_msg_0_}%f
> '


# Case Insensitive Tab Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'