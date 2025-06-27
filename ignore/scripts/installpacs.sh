#!/bin/bash
set -e

packages=(
    atuin
    bat
    cliphist
    dunst
    eza
    fastfetch
    fd
    fzf
    ghostty
    hypridle
    hyprland
    # hyprlock
    hyprpaper
    hyprshot
    hyprsunset
    polkit
    hyprpolkitagent
    imv
    mpv
    jq
    libnotify
    neovim
    # pavucontrol
    ripgrep
    rofi-wayland
    stow
    tldr
    tmux
    # ttf-font-awesome
    ttf-jetbrains-mono-nerd
    waybar
    wireplumber
    wl-clipboard
    wl-clip-persist
    xdg-desktop-portal-hyprland
    yazi
    zoxide
    uwsm
    libnewt
    nvidia-utils
    egl-wayland
    pipewire-pulse
    ncdu
    qt5-wayland
    qt6-wayland
    openssh
    udiskie
    udisks2
    timeshift
    zsh
    gitleaks
    less
    # steam
    # lib32-nvidia-utils
    # lib32-vulkan-icd-loader
    # lib32-libglvnd
    # vulkan-icd-loader
    # nvidia-dkms
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

# pdf editor?
#
#
#
#
# bind = SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy
#
# Paru:
# overskride maybe need to configure
#
#
# For uwsm in zshrc i think
#
# if uwsm check may-start; then
#    exec uwsm start hyprland.desktop
# fi
#
# launch apps using uwsm (Use for long running tools)
# exec-once = uwsm app -- waybar  # Status bar
# exec-once = uwsm app -- udiskie --tray  # USB automount
# do dunst too
# bind = SUPER, E, exec, uwsm app -- pcmanfm-qt.desktop  # Safe (GUI app)
#
#
# get hyprpm plugin
#
#
#
# Do this in /etc/modprobe.d/nvidia.conf            should be done already tho
# options nvidia_drm modeset=1
#
#
# Early KMS will allow the Nvidia modules to load earlier into the boot sequence. On distros using mkinitcpio, like Arch, you can enable it by editing /etc/mkinitcpio.conf. In the MODULES array add the following module names:
#
# MODULES=(... nvidia nvidia_modeset nvidia_uvm nvidia_drm ...)
# then sudo mkinitcpio -P and reboot
#
# add to hyprland config
# env = LIBVA_DRIVER_NAME,nvidia
# env = __GLX_VENDOR_LIBRARY_NAME,nvidia
