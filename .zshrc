# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode disabled  # disable automatic updates

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(colorize extract zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export LANG=es_AR.UTF-8

export EDITOR='nvim'
export editor='nvim'
export PAGER='less'
export pager='less'

## Custom aliases
alias .z="nvim ~/.zshrc"
alias .i="nvim ~/.config/i3/config"
alias .v="nvim ~/.vimrc"
alias .pol="nvim ~/.config/polybar/config.ini"
alias rm='echo "Con rm borrás sin confirmación, usá trash-put"; false'
alias del="trash-put"
alias reiniciar="sudo reboot now"
alias off="sudo shutdown now"
alias susp='lock && systemctl suspend'
alias scr='cd ~/Software/scripts/'
alias conf='cd ~/.config'
alias mount="sudo mount"
alias umount="sudo umount"
alias cp="cp -ivr"
alias mkdir='mkdir -p'
alias b="busqueda"
alias p='pter $TODO_FILE'
alias ledger='ledger -f $LEDGER_FILE'

# versiones de nvim
alias nvn="NVIM_APPNAME=nvim_next nvim" #para nextjs
alias v="NVIM_APPNAME=nvim_vimscript nvim" #neovim con misma config que vim
alias nvk="NVIM_APPNAME=nvim_kickstart nvim" #neovim kickstart de tjdevries
alias nv="nvim"

alias ls="ls -hNX --color=auto --group-directories-first"
alias grep="grep --color=auto"

## Custom suffix aliases
alias -s md=vim
alias -s txt=nvim
alias -s pdf=mupdf

## Param aliases
inst() {
    sudo pacman -Syu --needed "$@" || yay -S --needed "$@"
}
# agregar variable de entorno
envar() { echo $1 >> ~/.zshenv }

plugins+=(zsh-completions)
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit
eval "$(register-python-argcomplete pipx)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/bin:$PATH"
#if [[ -x "/home/francisco/fzf/bin/fzf" ]]; then
#    export PATH="/home/francisco/fzf/bin/fzf:$PATH"
#fi
[[ -d /home/francisco/Software/scripts ]] && export PATH="/home/francisco/Software/scripts:$PATH"
[[ -d /home/francisco/.cargo/bin ]] && export PATH="/home/francisco/.cargo/bin:$PATH"
[[ -d /home/francisco/.config/emacs/bin ]] && export PATH="/home/francisco/.config/emacs/bin:$PATH"
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

#vim encryption
GPG_TTY=`tty`
export GPG_TTY

unset MANPATH

export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# bun completions
[ -s "/home/francisco/.bun/_bun" ] && source "/home/francisco/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Created by `pipx` on 2023-11-24 03:22:12
export PATH="$PATH:/home/francisco/.local/bin"

# establecer variable de entorno de numero de monitores
numero_monitores=$(xrandr --listmonitors | grep -c "Monitor" | awk '{print $2}' )
if [ "$numero_monitores" -eq 1 ]; then
    export UN_MONITOR=true
else
    export UN_MONITOR=false
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
