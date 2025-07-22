#!/bin/bash
# This script is to be executed after an `archinstall` of KDE Plasma
set -euo pipefail

main=(
    git eza yazi zsh zoxide nushell neovim wl-clipboard kitty
    pavucontrol firefox kdeconnect geoclue htop gwenview mpv vlc
    man fzf docker docker-compose npm fd ripgrep lua lua51 luarocks
    unrar lazygit tree-sitter-cli imagemagick ffmpeg firewalld yadm
    mermaid-cli python-pynvim glow
)

fonts=(
    noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra otf-font-awesome
    ttf-dejavu ttf-liberation ttf-droid ttf-ibm-plex ttf-indic-otf
    ttf-jetbrains-mono-nerd ttf-ibmplex-mono-nerd otf-libertinus
)

nvidia=(
    nvidia-utils nvidia-settings nvidia-prime lib32-nvidia-utils egl-wayland
)

aur=(
    dropbox popsicle-bin visual-studio-code-bin avizo sioyek-bin zotero resvg
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
echo "==> Installing zinit and changing shell to zsh..."
mkdir ~/.zsh
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
chsh -s /usr/bin/zsh

echo "==> Installing core packages..."
sudo pacman -S --needed "${softwares[@]}" "${fonts[@]}" "${nvidia[@]}" "${niri[@]}" "${extras[@]}"

# Enable essential services
echo "==> Enabling Bluetooth, Firewall, Docker and ssh-agent..."
sudo systemctl enable --now bluetooth
sudo systemctl enable --now firewalld
sudo systemctl enable --now docker
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
echo "  - Read: https://wiki.archlinux.org/title/NVIDIA#Early_loading"
echo "  - Add modules to mkinitcpio.conf and regenerate initramfs:"
echo "      sudo nvim /etc/mkinitcpio.conf"
echo "      sudo mkinitcpio -P"

echo "==> Final Tasks:"
echo "  - Install micromamba"
echo "  - Sign in to Dropbox"
echo "  - Sign in to firefox and chromium."
echo "  - Open Neovim and run :checkhealth to install any required software."
echo "  - After setting up ssh, clone Neovim configuration."

echo "✅ All done. Time to rice your system like the glorious Arch rebel you are, Aditya."
