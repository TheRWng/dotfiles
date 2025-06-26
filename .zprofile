# ------------ FZF Configuration ---------------
# Core settings
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude '.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude '.git'"

# Visual settings
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --no-multi \
--select-1 --exit-0 --color=hl:#2dd4bf --pointer='▶' --marker='✓'"

# Preview configurations
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons --tree --color=always {} | head -200'"
export FZF_TMUX_OPTS="-p90%,70%"

# Key bindings (ensure they're set after plugin load)
bindkey '^R' fzf-history-widget
bindkey '^T' fzf-file-widget
bindkey '^[c' fzf-cd-widget  # Alt+C
