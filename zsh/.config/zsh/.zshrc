export PATH=$PATH:/usr/local/go/bin:/home/justin/.local/bin:/home/justin/go/bin:/home/linuxbrew/.linuxbrew/bin:/home/justin/.local/share/cargo/bin:/home/justin/.local/share/bob/nvim-bin:/home/justin/Github/practice/bin
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export PNPM_HOME="/home/justin/.local/share/pnpm"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export ZSH="$XDG_DATA_HOME/oh-my-zsh"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
# export NVM_DIR="$XDG_DATA_HOME/nvm"
export NVM_DIR="$HOME/.config/nvm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"
hash -d github=$HOME/Github
hash -d config=$HOME/.config
hash -d docs=$HOME/Github/justinsgithub/docs
hash -d dotfiles=$HOME/Github/justinsgithub/dotfiles
hash -d justinsgithub=$HOME/Github/justinsgithub
hash -d justindevelops=$HOME/Github/justinsgithub/justindevelops
hash -d fonts=$HOME/.local/share/fonts
hash -d scripts=$HOME/Github/justinsgithub/dotfiles/scripts
hash -d practice=$HOME/Github/practice

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
plugins=( poetry vi-mode debian nvm pip docker docker-compose sudo copypath copybuffer copyfile fzf colorize colored-man-pages zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh
alias docker="sudo docker"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias n='export NVIM_APPNAME=nvim; nvim'
# alias npm="echo USE PNPM $@"
alias nn='export NVIM_APPNAME=natty-nvim; nvim'
alias p="pnpm"
alias quicknote="vim $HOME/myself/quicknotes.md"
alias laravel="$HOME/.config/composer/vendor/laravel/installer/bin/laravel"
alias -g L='|less'
# alias cat="ccat"
alias -g NUL="> /dev/null 2>&1"
alias ls='ls --color=auto'
alias l="ls -1"
alias rm="gio trash"
alias mkdir="mkdir -pv"
alias INSTALL='sudo apt install --install-suggests'
alias pyvenv="python3 -m venv venv"
alias pinstall="pip install"
alias sourcevenv="source venv/bin/activate"
alias mkserve="mkdocs serve"
alias mkbuild="mkdocs build"
alias zshconf="nvim ~dotfiles/zsh/.config/zsh/.zshrc && source ~/.config/zsh/.zshrc"
alias vimconf="nvim ~dotfiles/neovim/.config/nvim/init.lua"
alias weztermconf="nvim ~dotfiles/wezterm/.config/wezterm/wezterm.lua"
alias rustdocs="rustup docs --book"
alias packjson="cat ./package.json"
alias whichtheme="print $RANDOM_THEME"
alias whichports="sudo lsof -i -P -n | grep LISTEN"
alias f="find . -name $1"
alias capswitch="setxkbmap -option caps:escape"
alias nv="node --version"
alias yd="yarn dev"
alias gc="git clone"
alias yb="yarn build"
alias json="python3 -m json.tool"
alias pyserve="python3 -m http.server"
alias i3class="xprop"
alias update="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias gtypist="/bin/gtypist -b"
alias stow="stow --dir=$HOME/Github/justinsgithub/dotfiles --target=$HOME"
alias windowclassname="xprop"
alias npx="pnpm dlx"

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

zstyle ':completion:*' menu select
fpath+=~/.zfunc
autoload -Uz compinit

# to fix Node.js error, added command to the beginning of package.json "dev" command instead
# export NODE_OPTIONS=--openssl-legacy-provider 
# setxkbmap -I$HOME/.xkb -print | sed 's/\(xkb_symbols.*\)"/\1+custom(numlock_to_super)"/' | xkbcomp -I$HOME/.xkb - $DISPLAY  > /dev/null 2>&1
# setxkbmap -option "caps:swapescape"
# feh --bg-scale ~/.wallpapers/uhdpaper.com-download-hd-wallpaper-1204a.jpg
# export POETRY_VIRTUALENVS_IN_PROJECT=true
[ -f ~/.envars ] && source ~/.envars
# [ -f ~/.zreferences.sh ] && source ~/.zreferences.sh
# alias yarn="myyarn"

# pnpm
export PNPM_HOME="/home/justin/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
. "$HOME/.local/share/cargo/env"
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
eval "$(zoxide init zsh --cmd j)"
alias cd="j"
alias cdi="ji"
# autoload -U bashcompinit
# bashcompinit
# eval "$(register-python-argcomplete pipx)"
python_venv() {
  MYVENV=./env
  # when you cd into a folder that contains $MYVENV
  [[ -d $MYVENV ]] && source $MYVENV/bin/activate > /dev/null 2>&1
  # when you cd into a folder that doesn't
  [[ ! -d $MYVENV ]] && deactivate > /dev/null 2>&1
}
autoload -U add-zsh-hook
add-zsh-hook chpwd python_venv

python_venv
