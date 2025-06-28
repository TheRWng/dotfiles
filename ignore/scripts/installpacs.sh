#!/bin/bash
set -e

packages=(
	atuin
	bat
	btop
	cliphist
	dunst
	egl-wayland
	eza
	fastfetch
	fd
	fzf
	ghostty
	gitleaks
	hypridle
	hyprland
	hyprpaper
	hyprpolkitagent
	hyprshot
	hyprsunset
	imv
	jq
	less
	libnewt
	libnotify
	mpv
	ncdu
	neovim
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
	timeshift
	tldr
	tmux
	ttf-jetbrains-mono-nerd
	udiskie
	udisks2
	uwsm
	waybar
	wireplumber
	wl-clipboard
	wl-clip-persist
	xdg-desktop-portal-hyprland
	yazi
	zoxide
	zsh
	# hyprlock
	# lib32-libglvnd
	# lib32-nvidia-utils
	# lib32-vulkan-icd-loader
	# steam
	# ttf-font-awesome
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
