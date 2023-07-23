# Add $HOME/bin and $HOME/.local/bin to $PATH if they exist
[ -d "$HOME/bin" ] && PATH="$HOME"/bin:"$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME"/.local/bin:"$PATH"
export PATH

export EDITOR=nvim

# Matlab grey screen fix for tiling wm's
export _JAVA_AWT_WM_NONREPARENTING=1
