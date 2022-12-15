export PATH=$PATH:/usr/local/go/bin:/home/justin/.local/bin:/home/justin/bin:/home/justin/go/bin:/home/linuxbrew/.linuxbrew/bin

export ZSH="$HOME/.oh-my-zsh"

"$HOME/Github/social-automation/env/bin/activate"

[ -f ~/.envars ] && source ~/.envars
[ -f ~/.zrefrences ] && source ~/.zrefrences

ZSH_THEME="agnosterzac"

CASE_SENSITIVE="true"

export EDITOR="nvim"

# to fix Node.js error, added command to the beginning of package.json "dev" command instead
# export NODE_OPTIONS=--openssl-legacy-provider 

plugins=( vi-mode debian nvm pip docker docker-compose sudo copypath copybuffer copyfile fzf colorize colored-man-pages zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

# hash -d docs=$HOME/Github/docs

hash -d lua=$HOME/.config/nvim/lua

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

alias adminpass="cat ~/eztext/.pass"

alias py="python3"

alias pyvenv="python3 -m venv venv"

alias pinstall="pip install"

alias sourcevenv="source venv/bin/activate"

alias zshconfig="vim ~/stow-files/zsh/.zshrc; zsh;"

alias mkserve="mkdocs serve"

alias mkbuild="mkdocs build"

alias vimconfig="vim ~/stow-files/neovim/.config/nvim"
alias vconf="vim ~/stow-files/neovim/.config/nvim"

alias vinit="vim ~/stow-files/neovim/.config/nvim/init.lua"

alias vplug="vim ~/stow-files/neovim/.config/nvim/lua/user/plugins.lua"

alias vmaps="vim ~/stow-files/neovim/.config/nvim/lua/user/keymaps.lua"

alias correctspelling="vim ~/.config/nvim/lua/user/misspellings.lua"

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

alias t="typer"

# docker
alias Dimages="docker images" # list all local docker images
alias Dinspect="docker inspect $1" # outputs information about specified image
alias Dstart="docker start $1" # run a container in the background
alias Dkill="docker kill $1" # kills specified image
alias Dattach="docker attach $1" # enter a container
alias Dprune="docker container prune" # removes all stopped containers
alias Drmimage="docker rmi $1" # removes specified image
alias Drm="docker rm $1" # removes specified container
alias Dbuild="docker build ." # builds image from ./Dockerfile 
alias Dbuildfile="docker build -f $1 ." # builds image from specified file # this alias syntax does not work
alias Dbuildtag="docker build -t $1 ." # builds image from repository of specified name and tags as $1:latest, this alias syntax does not work
alias Dcommit="docker commit $1 $2" # creates an image from a container
alias Drunports="docker run -d -P $1" # runs container in background and maps the exposed container port to a port on our localhost
alias Dmapports="docker run -d -p 3000:8080 $1" # runs container and exposes container port 8080 to our localhost:3000 
alias Dnetwork="docker network ls" # lists existing docker networks
alias Dhost="docker run -d --network=host ubuntu_networking /webapp" #runs image and command in background and exposes container ports on localhost
alias Dnone="docker run -d --network=none ubuntu_networking /webapp" #runs container in background without any networking capabilities outside of itself
alias Drunmountbind='docker run -d --mount type=bind,src="/home/justin/docs/src/software/docker/demo/logs",dst=/logs scratch_volume' # persists data from docker container in specified directory
alias Drunmountvolume='docker run -d --mount type=volume,src="logs",dst=/logs scratch_volume' # persists data from docker container in Docker managed "logs" directory 
alias Druntmpfs='docker run -it --mount type=tmpfs,dst=/logs ubuntu' # data is only available inside the container while it runs and will be erased once the container stops
alias Dlistvolumes='docker volume ls'
alias Dinspectvolume="docker volume inspect $1" #inspects specified volume
alias Dbuildtag='docker build -t "demo_tag" .' # builds docker image named demo_tag (under repository) with the tag latest  
alias Dtag='docker tag tag_demo:latest tag_demo:v1' # builds the same docker image but with a different tag
alias Dtagpublish='docker tag tag_demo:latest justinaawd/tag_demo:latest && docker push justinaawd/tag_demo' # changes tag and pushes to docker repository

# docker-compose
alias DCupd='docker-compose up -d' # builds containers from assumed file name "docker-compose.yml"
alias DCfile='docker-compose -f my-compose-file.yaml up -d' # creates containers using specified file

# php
alias compinstall='composer install' # installs dependencies from composer.json file
alias drushcr='drush cr' # rebuilds drupal cache
alias drushsql='drush sql-cli < my-database.sql' # creates drupal site from database file
alias drushupdb='drush updatedb' # applies database updates

# apt package manager
alias Aupdate='sudo apt update && sudo apt upgrade' # syncs packages with repo and completes any available package upgrades
alias Ainstalled='sudo apt list --installed' # lists all installed packages
alias install="sudo apt install --install-recommends $@" # installs all command line arguments
alias Asearch='sudo apt search ^stow$' # searches for package with exactly the name stow
alias Agrepinstalled='sudo apt list --installed | grep htop' # lists all installed packages with the name htop included
alias Arepos='cat /etc/apt/sources.list'

# basics 
alias timels='time ls -R1'  # times the specified command and shows how much of the time was in user space and how much of it was in kernel / system space

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
eval "$(rbenv init - zsh)"

# export PATH="/home/linuxbrew/.linuxbrew/opt/openssl@3/bin:$PATH"
[ -f "$HOME/Github/social-automation/env/bin/activate" ] && source "$HOME/Github/social-automation/env/bin/activate"

# pnpm
export PNPM_HOME="/home/justin/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc
