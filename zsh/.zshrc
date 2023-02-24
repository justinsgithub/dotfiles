export PATH=$PATH:/usr/local/go/bin:/home/justin/.local/bin:/home/justin/bin:/home/justin/go/bin:/home/linuxbrew/.linuxbrew/bin

export ZSH="$HOME/.oh-my-zsh"

# [ -f ~/.envars ] && source ~/.envars

# [ -f ~/.zreferences.sh ] && source ~/.zreferences.sh

ZSH_THEME="agnosterzac"

CASE_SENSITIVE="true"

export EDITOR="nvim"

# plugins=( npm-yarn vi-mode debian nvm pip docker docker-compose sudo copypath copybuffer copyfile fzf colorize colored-man-pages zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting )
plugins=( vi-mode debian nvm pip docker docker-compose sudo copypath copybuffer copyfile fzf colorize colored-man-pages zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

# hash -d docs=$HOME/Github/docs

hash -d lua=$HOME/.config/nvim/lua

# alias npm="mynpm"
# alias yarn="myyarn"

alias vim="nvim"

alias v="nvim"

alias quicknote="vim $HOME/myself/quicknotes.md"

alias laravel="$HOME/.config/composer/vendor/laravel/installer/bin/laravel"

alias -g L='|less'

alias cat="ccat"

alias -g NUL="> /dev/null 2>&1"

alias ls='ls --color=auto'

alias l="ls -1"

alias rm="mv --force -t ~/.archive"

alias mkdir="mkdir -pv"

alias nrb="npm run build"

alias nrd="npm run dev"

alias python="python3.11"

alias py="python3.11"

alias python3="python3.11"

alias pyvenv="python3 -m venv venv"

alias pinstall="pip install"

alias sourcevenv="source venv/bin/activate"

alias zshconfig="vim ~/stow-files/zsh/.zshrc; zsh;"

alias mkserve="mkdocs serve"

alias mkbuild="mkdocs build"

alias vimconfig="vim ~/stow-files/neovim/.config/nvim"

alias vimcorrect="vim ~/Github/correct-me-daddy/plugin/contributions/JustinsGithub.vim"

alias svimconfig='vim ~/.SpaceVim.d/init.toml'

alias weztermconfig="vim ~/stow-files/wezterm/.config/wezterm/wezterm.lua"

alias promptconfig="vim ~/.oh-my-zsh/custom/themes/agnosterzac.zsh-theme"

alias rustdocs="rustup docs --book"

alias packjson="cat ./package.json"

alias whichtheme="print $RANDOM_THEME"

alias whichports="sudo lsof -i -P -n | grep LISTEN"

alias f="find . -name $1"

alias capswitch="setxkbmap -option caps:escape"

alias nv="node --version"

alias yd="yarn dev"

alias yb="yarn build"

alias json="python3 -m json.tool"

alias pip="python3.11 -m pip"

alias update="sudo apt update && sudo apt upgrade"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
# eval "$(rbenv init - zsh)"

# [ -f "$HOME/Github/social-automation/env/bin/activate" ] && source "$HOME/Github/social-automation/env/bin/activate"

# pnpm
export PNPM_HOME="/home/justin/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# to fix Node.js error, added command to the beginning of package.json "dev" command instead
# export NODE_OPTIONS=--openssl-legacy-provider 
setxkbmap -option "caps:swapescape"
