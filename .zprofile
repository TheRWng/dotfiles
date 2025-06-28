# Auto-start Hyprland on tty1 if no display is detected
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec Hyprland
fi

#FZF Configuration

# Core settings
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude '.git' --exclude '.svn' --exclude '.hg'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude '.git' --exclude '.svn' --exclude '.hg'"

# wl-copy for wayland!
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --color=hl:#2dd4bf --pointer='❯' --scheme=path --bind 'ctrl-y:execute-silent(echo -n {} | wl-copy)'"

# Preview configurations
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons --tree --color=always {} | head -200'"

# Tmux settings
export FZF_TMUX_OPTS="-p90%,70%"

# Bat configuration
export BAT_THEME="ansi"  # Uses terminal colors
