# Add $HOME/bin and $HOME/.local/bin to $PATH if they exist
[ -d "$HOME/bin" ] && PATH="$HOME"/bin:"$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME"/.local/bin:"$PATH"
export PATH

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Common programs
export EDITOR=nvim
export BROWSER=firefox

# Matlab grey screen problem fix for tiling window managers
export _JAVA_AWT_WM_NONREPARENTING=1
