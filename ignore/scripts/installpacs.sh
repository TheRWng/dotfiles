#!/bin/bash
set -e

packages=(
  atuin
  bat
  blueberry
  btop
  cliphist
  cpupower
  deno
  dunst
  egl-wayland
  eza
  fastfetch
  fd
  fzf
  ghostty
  ghostscript
  gitleaks
  hypridle
  hyprland
  hyprlock
  hyprpaper
  hyprpolkitagent
  hyprshot
  hyprsunset
  imagemagick
  imv
  jq
  lazygit
  less
  libnewt
  libnotify
  linux
  linux-headers
  lua51 # For lazyvim
  luarocks
  mermaid-cli
  mpv
  ncdu
  neovim
  networkmanager
  network-manager-applet
  nodejs
  nvidia-dkms
  nvidia-utils
  openssh
  pavucontrol
  pipewire-pulse
  polkit
  qt5-wayland
  qt6-wayland
  ripgrep
  rofi-wayland
  stow
  tectonic
  telegram-desktop
  timeshift
  tldr
  tmux
  tree-sitter
  tree-sitter-cli
  ttf-jetbrains-mono-nerd
  udiskie
  udisks2
  waybar
  wireplumber
  wl-clipboard
  wl-clip-persist
  xdg-desktop-portal-hyprland
  yazi
  zoxide
  zsh
  # alsa-utils
  # gamescope       # For problems with steam/proton games
  # lib32-nvidia-utils
  # steam
  # ttf-font-awesome
  # hyprpm plugin if using hyprland plugins
)

# Check if package is installed
is_installed() {
  pacman -Qi "$1" &>/dev/null
}

# Update package database
echo "Updating package database..."
sudo pacman -Sy

for pkg in "${packages[@]}"; do
  if pacman -Qi "$pkg" &>/dev/null; then
    echo "[SKIPPED] $pkg is already installed"
  else
    echo "[INSTALLING] $pkg..."
    sudo pacman -S --needed --noconfirm "$pkg" || echo "[WARNING] Failed to install $pkg"
  fi
done

echo "Installation complete. Reboot recommended for Hyprland."
