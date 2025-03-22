export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export ZSH="$HOME/.oh-my-zsh"
hash -d github=$HOME/github
hash -d dotfiles=$HOME/github/justinsgithub/dotfiles
hash -d justinsgithub=$HOME/github/justinsgithub
alias ls='ls --color=auto'
alias l="ls -1"
alias rm="gio trash"
alias mkdir="mkdir -pv"
alias zshconf="nvim ~/.zshrc"
alias vimconf="nvim ~dotfiles/neovim/.config/nvim/init.lua"
alias weztermconf="nvim ~dotfiles/wezterm/.config/wezterm/wezterm.lua"
alias whichports="sudo lsof -i -P -n | grep LISTEN"
alias f="find . -name $1"
alias json="python3 -m json.tool"
alias update="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias stow="stow --dir=$HOME/github/justinsgithub/dotfiles --target=$HOME"


ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 1

plugins=( poetry vi-mode debian nvm pip docker docker-compose sudo copypath copybuffer copyfile fzf colorize colored-man-pages zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

python_venv() {
  MYVENV=./env
  # when you cd into a folder that contains $MYVENV
  [[ -d $MYVENV ]] && source $MYVENV/bin/activate > /dev/null 2>&1
  # when you cd into a folder that doesn't
  [[ ! -d $MYVENV ]] && deactivate > /dev/null 2>&1
}
python_venv

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/home/justin/.bun/_bun" ] && source "/home/justin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
