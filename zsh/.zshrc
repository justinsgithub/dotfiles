export PATH=$PATH:/usr/local/go/bin:/home/justin/.local/bin:/home/justin/bin/nvim-linux64/bin

export PATH=/usr/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="nicoulaj"

CASE_SENSITIVE="true"

plugins=( debian nvm pip docker docker-compose sudo copypath copybuffer copyfile fzf colorize colored-man-pages zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

hash -d docs=$HOME/docs

hash -d myself=$HOME/myself
  
hash -d eztext=$HOME/eztezt

alias quicknote="vim $HOME/myself/quicknotes.md"

alias laravel="$HOME/.config/composer/vendor/laravel/installer/bin/laravel"

alias -g L='|less'

alias cat="ccat"

alias -g NUL="> /dev/null 2>&1"

alias ls='ls --color=auto'

alias l="ls -1"

alias rm="mv --force -t ~/.archive"

alias v="nvim"

alias vim="nvim"

alias mkdir="mkdir -pv"

alias adminpass="cat ~/eztext/.pass"

alias py="python3"

alias pyvenv="python3 -m venv venv"

alias pinstall="pip install"

alias sourcevenv="source venv/bin/activate"

alias zshconfig="vim ~/stow-files/zsh/.zshrc; zsh"

alias mkserve="mkdocs serve"

alias mkbuild="mkdocs build"

alias vimconfig="vim ~/stow-files/nvim/.config/nvim/init.lua"

alias keymaps="vim ~/stow-files/nvim/.config/nvim/lua/user/keymaps.lua"

alias correctspelling="vim ~/.config/nvim/lua/user/misspellings.lua"

alias svimconfig='vim ~/.SpaceVim.d/init.toml'

alias weztermconfig="vim ~/stow-files/wezterm/.config/wezterm/wezterm.lua"

alias promptconfig="vim ~/.config/zsh/.oh-my-zsh/custom/themes/my.zsh-theme"

alias rustdocs="rustup docs --book"

alias packjson="cat ./package.json"

alias whichtheme="print $RANDOM_THEME"

alias whichports="sudo lsof -i -P -n | grep LISTEN"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
