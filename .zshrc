

typeset -U path cdpath fpath manpath

for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

HELPDIR="/nix/store/i6marj58n6s0mbchcvgljqqwqgq4k03k-zsh-5.9/share/zsh/$ZSH_VERSION/help"




path+="$HOME/.zsh/plugins/powerlevel10k"
fpath+="$HOME/.zsh/plugins/powerlevel10k"

# Oh-My-Zsh/Prezto calls compinit during initialization,
# calling it twice causes slight start up slowdown
# as all $fpath entries will be traversed again.
autoload -U compinit && compinit
source /nix/store/1k69p3bxk50b8rf0kc7b71422zxvqv0g-zsh-autosuggestions-0.7.1/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history)






if [[ -f "$HOME/.zsh/plugins/powerlevel10k/share/zsh-powerlevel10k/powerlevel10k.zsh-theme" ]]; then
  source "$HOME/.zsh/plugins/powerlevel10k/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"
fi


# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="/home/kira/.local/share/zsh/history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
unsetopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
unsetopt HIST_SAVE_NO_DUPS
unsetopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt autocd

if [[ $options[zle] = on ]]; then
  eval "$(/nix/store/d8fpqmf3igvi2qf2l78g6q3qmsh37j7i-fzf-0.58.0/bin/fzf --zsh)"
fi

  fastfetch

  # Enable Powerlevel10k instant prompt
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
     source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source the theme
source /nix/store/s1snyxpm1k68wcn16hf91qglnzjxd3b4-powerlevel10k-1.20.14/share/zsh-powerlevel10k/powerlevel10k.zsh-theme


# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

 # highlight man using nvim
 vman() { nvim <(man $1); }

 warper() {
      sudo warp-svc
      warp-cli connect
  }

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat /home/kira/.cache/wal/sequences &)

if test -n "$KITTY_INSTALLATION_DIR"; then
  export KITTY_SHELL_INTEGRATION="no-rc"
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
  unfunction kitty-integration
fi


# Aliases
alias -- 177013='xdg-open https://nhentai.to/g/177013'
alias -- 344322='xdg-open https://nhentai.net/g/344322'
alias -- g=git
alias -- ga='git add'
alias -- gaa='git add --all'
alias -- gb='git branch'
alias -- gc='git commit -v'
alias -- gcl='git clone'
alias -- gcmsg='git commit -m'
alias -- gco='git checkout'
alias -- gd='git diff'
alias -- gf='git fetch'
alias -- gl='git log'
alias -- glog='git log --oneline --decorate --graph'
alias -- gm='git merge'
alias -- gp='git push'
alias -- gpl='git pull'
alias -- grb='git rebase'
alias -- grh='git reset --hard'
alias -- grs='git reset'
alias -- gs='git status'
alias -- img='kitten icat'
alias -- ls=eza
alias -- rebuild='sudo nixos-rebuild switch --flake ~/flake#kage --impure'
alias -- saymyname='echo Heisenberg'
alias -- wifilogin='~/bits-login/login.sh'

# Named Directory Hashes


source /nix/store/1nxj3yxyd5pmm89kf2wanv704sjinf8i-zsh-syntax-highlighting-0.8.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=()




