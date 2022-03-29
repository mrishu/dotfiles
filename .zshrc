# Aliases and Functions {{{ 
alias 'ls'='exa'
alias 'll'='exa -lah'
alias 'la'='exa -ah'
alias 'lf'='lfrun'

# Load fasd
eval "$(fasd --init auto)"
alias v='f -e $EDITOR' # quick opening files with vim
alias m='f -e mpv' # quick opening files with mplayer
alias o='a -e xdg-open' # quick opening files with xdg-open
alias c='fasd_cd -d'

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
bindkey -s '^o' '^ulfcd\n'

# }}}

# History Settings {{{ 
HISTFILE=~/.zsh/zsh_histfile
HISTSIZE=1000
SAVEHIST=10000
# }}}

# Completion system {{{
zstyle ':completion:*' completer _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' max-errors 10
zstyle ':completion:*' menu select=3
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/adi/.zshrc'
autoload -Uz compinit
compinit
# }}}

# Load Plugins {{{
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fsh/fast-syntax-highlighting.plugin.zsh
# }}}

# vim:set foldmethod=marker:
