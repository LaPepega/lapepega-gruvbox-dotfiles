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

alias ll='ls -l'

alias cls='clear'
alias cll='cls;l'
alias vpn='doas openvpn'

alias rr='rm -fr'
alias cp='cp -fr'

alias d='doas'
#alias cat='bat'
alias slp='xset dpms force off'
alias nano='nano --rcfile ~/.config/nano/nanorc'
alias grep='grep --color=auto'
alias wget="wget --hsts-file=\"$HOME/.etc/wget-hsts\""
alias opn="xdg-open"
alias nn="nano"
alias nv='nvim'
alias fox='firefox'
alias clip="xclip -selection clipboard"
alias slp='xset dpms force off'
scrt() {scrot -s '/home/lapepega/Pictures/Screenshots/%Y-%m-%d_%H:%M:%S.png' -e 'xclip -selection clipboard -t image/png -i $f'}
scrt0() {scrot -s '/home/lapepega/Pictures/Screenshots/%Y-%m-%d_%H:%M:%S.png' -e '0x0 file $f' | xclip -selection clipboard}
alias a='atool'
alias x='exit'
alias ncode='nix-shell --command "code .;exit"'

alias pacss='doas pacman -Ss'
alias pacs='doas pacman -S'
alias pacr='doas pacman -R'
alias pacu='doas pacman -Syu'

alias yays='yay -S'
alias yayr='yay -R'
alias yayss='yay -Ss'
alias yayu='yay -Syu'

alias upd='pacu && yayu'

alias proton='STEAM_COMPAT_DATA_PATH=~/.prtn STEAM_COMPAT_CLIENT_INSTALL_PATH=~/.prtn /home/lapepega/.steam/steam/steamapps/common/Proton\ -\ Experimental/proton run '
alias protonGE='STEAM_COMPAT_DATA_PATH=~/.prtn-ge STEAM_COMPAT_CLIENT_INSTALL_PATH=~/.prtn-ge /usr/share/steam/compatibilitytools.d/proton-ge-custom/proton run '
alias prtnGE='protonGE'
alias prtn='proton'
alias gitfuck='git add -A && git commit -m $(date +%Y-%m-%d) && git push'

fnd() { doas find / -name $1}
mkcd() { mkdir $1 && cd $1; }
det() { $@ &;disown }
lk() { 'cd' "$(EDITOR=nano walk --icons --fuzzy "$@")" && clear && l }

mnt() { doas mkdir /mnt/$1 && doas mount /dev/$1 /mnt/$1 || doas rm -fr /mnt/$1 }
umnt() { doas umount /mnt/$1 && doas rm -fr /mnt/$1; }

eval "$(zoxide init zsh)"
zl() { z $@ && clear && l}
#alias cd='z'
cdl() { cd $@ && clear && l }


autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

export TERM=kitty

# End of lines added by compinstall
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/lapepega/.dart-cli-completion/zsh-config.zsh ]] && . /home/lapepega/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

