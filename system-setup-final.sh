#!/bin/bash
set -euo pipefail

# Define packages
softwares=(
    git eza yazi zsh zoxide nushell neovim wl-clipboard kitty
    pavucontrol firefox kdeconnect geoclue htop gwenview mpv vlc
    man fzf docker docker-compose npm fd ripgrep lua51 luarocks
    unrar lazygit tree-sitter-cli imagemagick ffmpeg firewalld yadm
)

fonts=(
    noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
    ttf-dejavu ttf-liberation ttf-droid ttf-ibm-plex ttf-indic-otf
    ttf-jetbrains-mono-nerd ttf-ibmplex-mono-nerd otf-libertinus
)

nvidia=(
    nvidia-utils nvidia-settings nvidia-prime lib32-nvidia-utils egl-wayland
)

aur=(
    dropbox popsicle-bin visual-studio-code-bin avizo sioyek-bin zotero
)

niri=(
    niri swaybg swayidle gtklock fuzzel waybar brightnessctl gammastep
    wev wofi mako
)

extras=(
    texlive texlive-bin libreoffice-fresh inkscape ublock-origin
    chromium bitwarden calibre obsidian wine winetricks flatpak
    fastfetch lutris
)

echo "==> Installing core packages..."
sudo pacman -S --needed "${softwares[@]}" "${fonts[@]}" "${nvidia[@]}" "${niri[@]}" "${extras[@]}"

# Enable essential services
echo "==> Enabling Bluetooth, Firewall and ssh-agent..."
sudo systemctl enable --now bluetooth
sudo systemctl enable --now firewalld
systemctl --user enable --now ssh-agent

# Install yay (if not already installed)
if ! command -v yay &>/dev/null; then
    echo "==> Installing yay..."
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git ~/yay && cd ~/yay && makepkg -si && cd - && rm -rf ~/yay
else
    echo "yay already installed."
fi

# Install AUR packages
echo "==> Installing AUR packages..."
yay -S --needed "${aur[@]}"

echo "==> Reminder: Configure NVIDIA drivers properly!"
echo "  - Read: https://wiki.archlinux.org/title/NVIDIA"
echo "  - Add modules to mkinitcpio.conf and regenerate initramfs:"
echo "      sudo nvim /etc/mkinitcpio.conf"
echo "      sudo mkinitcpio -P"

echo "==> Final Tasks:"
echo "  - Install zinit (or your preferred zsh plugin manager)"
echo "  - Sign in to Dropbox"
echo "  - Set up tailscale: curl -fsSL https://tailscale.com/install.sh | sh"
echo "  - Open Neovim and run :checkhealth to install language servers, formatters, etc."

echo "✅ All done. Time to rice your system like the glorious Arch rebel you are, Aditya."
