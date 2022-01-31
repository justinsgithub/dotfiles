export PATH=$PATH:/usr/local/go/bin:/home/justin/.local/bin:/home/justin/bin/nvim-linux64/bin
export PATH=/usr/bin:$PATH
#export DOCKER_HOST=unix:///run/user/1000/docker.sock
#export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock



export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="my"

CASE_SENSITIVE="true"

plugins=( sudo copydir copybuffer copyfile fzf vi-mode colorize colored-man-pages zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

hash -d config=$HOME/.config
hash -d luaconfig=$HOME/.config/nvim/lua/user
hash -d neovimconfig=$HOME/.config/nvim
hash -d nvimconfig=$HOME/.config/nvim
hash -d desktop=$HOME/Desktop
hash -d documents=$HOME/Documents
hash -d learning=$HOME/Documents/Learning
hash -d blog=$HOME/Public/blog
hash -d blogcontent=$HOME/Public/blog/content
hash -d projects=$HOME/Projects
hash -d github=$HOME/github
hash -d justinsgithub=$HOME/github/justinsgithub
hash -d portfolio=$HOME/github/justinsgithub/portfolio
hash -d static=$HOME/github/justinsgithub/static
hash -d docs=$HOME/docs
hash -d markdown=$HOME/docs/markdown
hash -d code=$HOME/docs/code
hash -d codeexamples=$HOME/docs/code-examples
hash -d work=$HOME/jltech
hash -d eztext=$HOME/jltech/eztext-project/eztext


alias -g L='|less'

alias cat="/home/justin/bin/ccat"

alias -g NUL="> /dev/null 2>&1"

alias ls='ls --color=auto'

alias l="ls -1"

alias rm="mv --force -t ~/.archive"

#alias R="\rm -rf"

alias vim="nvim"

alias mkdir="mkdir -pv"

#alias python="python3"

alias adminpass="cat ~/work/eztext-project/.secrets/.pass"

alias py="python3"

alias pyvenv="python3 -m venv venv"

alias pinstall="pip install"

alias sourcevenv="source venv/bin/activate"

alias zshconfig="vim ~/.zshrc; zsh"

alias mkserve="mkdocs serve"

alias mkbuild="mkdocs build"

alias vimconfig='vim ~/.config/nvim/init.vim'

alias correctspelling="vim ~/.config/nvim/lua/user/common-misspellings.lua"

alias svimconfig='vim ~/.SpaceVim.d/init.toml'

alias weztermconfig="vim ~/.wezterm.lua"

alias promptconfig="vim ~/.config/zsh/.oh-my-zsh/custom/themes/my.zsh-theme"

alias linode="ssh example_user@45.79.95.120"

alias rustdocs="rustup docs --book"

alias install="sudo apt-get --install-suggests -y $@"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

