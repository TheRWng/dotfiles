#!/bin/bash

# Set GNOME color scheme to prefer dark mode
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

# Set GTK theme to Adwaita-dark
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark

echo "GNOME theme has been set to dark mode and Adwaita-dark"
