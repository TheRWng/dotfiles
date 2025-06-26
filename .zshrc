# source antidote
# git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
source $HOME/.antidote/antidote.zsh
antidote load
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit && prompt pure
eval "$(zoxide init zsh)"

# zstyle ':completion:*' verbose yes
# zstyle ':completion:*:messages' format '%d'
# zstyle ':completion:*:warnings' format 'No matches: %d'

# source /usr/share/fzf/key-bindings.zsh
# source /usr/share/fzf/completion.zsh

# export PATH="$HOME/.local/bin/:$PATH"
# bindkey -s ^f "tmux-sessionizer\n"
# bindkey -s '\eh' "tmux-sessionizer -s 0\n"
# bindkey -s '\et' "tmux-sessionizer -s 1\n"
# bindkey -s '\en' "tmux-sessionizer -s 2\n"
# bindkey -s '\es' "tmux-sessionizer -s 3\n"

# Aliases
alias vim='nvim'
alias tmux="tmux -2"
alias find='fd'
alias cat='bat --theme="custom" --paging=never'
alias ls="eza --all --group-directories-first --sort=modified --color=always --icons=always --no-user --no-filesize"
alias lst="eza --all --tree --level=2 --color=always --icons=always --no-user --no-filesize"
alias grep='rg --smart-case --hidden'

alias pacs='sudo pacman -S --needed'
alias pars='paru -S --needed'

# Prevent accidental overwrites and appends
set -o noclobber
