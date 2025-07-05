#!/bin/bash
set -e

packages=(
  asdf-vm
  spotify
  webcord
  # whatsapp-for-linux         doesnt work
  wlogout
  zen-browser-bin
)

# Check if package is installed
is_installed() {
  paru -Qi "$1" &>/dev/null
}

# Update package databases
echo "Updating package databases..."
paru -Sy --noconfirm

for pkg in "${packages[@]}"; do
  if is_installed "$pkg"; then
    echo "[SKIPPED] $pkg is already installed"
  else
    echo "[INSTALLING] $pkg..."
    paru -S --needed --noconfirm "$pkg" || echo "[WARNING] Failed to install $pkg"
  fi
done

echo "Installation complete. Reboot recommended for Hyprland."
