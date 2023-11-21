setopt autocd
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt share_history
setopt hist_ignore_space
setopt hist_verify
setopt hist_ignore_all_dups
setopt prompt_subst
PS1='%n@%m $(shrink_path -f)> '

HISTSIZE=10000000
SAVEHIST=10000000

[ -d $XDG_CACHE_HOME/zsh/ ] || mkdir -p $XDG_CACHE_HOME/zsh/

HISTFILE="$XDG_CACHE_HOME"/zsh/history
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
_comp_options+=(globdots)

bindkey -e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

source ~/.config/sh/aliases
source ~/.config/zsh/shrink-path.zsh
