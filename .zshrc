# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.config/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lapepega/.zshrc'
zstyle ':completion:*' menu select

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Aliases
alias renix="sudo nixos-rebuild switch"
alias ls='ls --color=auto --group-directories-first'

l() {
        if [ $# -eq 0 ]
        then
                ls -lA -d .*;
        else
                (cd "$@"; ls -lA -d .*);
        fi
        ls -l "$@";
        echo '';
}

alias cls='clear'
alias cll='cls;l'

alias rr='rm -fr'
alias cp='cp -fr'

alias !='doas'

alias nano='nano --rcfile ~/.config/nano/nanorc'
alias grep='grep --color=auto'
alias wget="wget --hsts-file=\"$HOME/.etc/wget-hsts\""
alias opn="xdg-open"
alias nn="nano"
alias fox='firefox'
alias clip="xclip -selection clipboard"
alias a='atool'
alias x='exit'
alias ncode='nix-shell --command "code .;exit"'

fnd() { doas find / -name $1}
mkcd() { mkdir $1 && cd $1; }
det() { $@ &;disown }
lk() { cdl "$(walk "$@")" }

mnt() { doas mkdir /mnt/$1 && doas mount /dev/$1 /mnt/$1 || doas rm -fr /mnt/$1 }
umnt() { doas umount /mnt/$1 && doas rm -fr /mnt/$1; }

eval "$(zoxide init zsh)"
zl() { z $@ && clear && l}
alias cd='z'
cdl() { z $@ && clear && l }


autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

export TERM=kitty

# End of lines added by compinstall
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
