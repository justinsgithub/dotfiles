export PATH=$PATH:/usr/local/go/bin:/Users/justin/.local/bin:/Users/justin/Library/Python/3.8/bin

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnosterzac"

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

#alias rm="mv --force -t ~/.archive" does not work with mac ?

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

alias vimconfig="vim ~/stow-files/neovim/.config/nvim"

alias keymaps="vim ~/stow-files/nvim/.config/nvim/lua/user/keymaps.lua"

alias correctspelling="vim ~/.config/nvim/lua/user/misspellings.lua"

alias svimconfig='vim ~/.SpaceVim.d/init.toml'

alias weztermconfig="vim ~/stow-files/wezterm/.config/wezterm/wezterm.lua"

alias promptconfig="vim ~/.config/zsh/.oh-my-zsh/custom/themes/my.zsh-theme"

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

alias dimages="docker images" # list all local docker images
alias dinspect="docker inspect $1" # outputs information about specified image
alias dstart="docker start $1" # run a container in the background
alias dkill="docker kill $1" # kills specified image
alias dattach="docker attach $1" # enter a container
alias dprune="docker container prune" # removes all stopped containers
alias drmimage="docker rmi $1" # removes specified image
alias drm="docker rm $1" # removes specified container
alias dbuild="docker build ." # builds image from ./Dockerfile 
alias dbuildfile="docker build -f $1 ." # builds image from specified file # this alias syntax does not work
alias dbuildtag="docker build -t $1 ." # builds image from repository of specified name and tags as $1:latest, this alias syntax does not work
alias dcommit="docker commit $1 $2" # creates an image from a container
alias drunports="docker run -d -P $1" # runs container in background and maps the exposed container port to a port on our localhost
alias dmapports="docker run -d -p 3000:8080 $1" # runs container and exposes container port 8080 to our localhost:3000 
alias dnetwork="docker network ls" # lists existing docker networks
alias dhost="docker run -d --network=host ubuntu_networking /webapp" #runs image and command in background and exposes container ports on localhost
alias dnone="docker run -d --network=none ubuntu_networking /webapp" #runs container in background without any networking capabilities outside of itself
alias drunmountbind='docker run -d --mount type=bind,src="/home/justin/docs/src/software/docker/demo/logs",dst=/logs scratch_volume' # persists data from docker container in specified directory
alias drunmountvolume='docker run -d --mount type=volume,src="logs",dst=/logs scratch_volume' # persists data from docker container in Docker managed "logs" directory 
alias druntmpfs='docker run -it --mount type=tmpfs,dst=/logs ubuntu' # data is only available inside the container while it runs and will be erased once the container stops
alias dlistvolumes='docker volume ls'
alias dinspectvolume="docker volume inspect $1" #inspects specified volume
alias dlogs="docker logs $1" # prints any output from the container, such as console.logs from a nodejs app


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # To use the bundled libc++ please add the following LDFLAGS:
#   LDFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"
#
# llvm is keg-only, which means it was not symlinked into /opt/homebrew,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.
#
# If you need to have llvm first in your PATH, run:
#   echo 'export PATH="/opt/homebrew/opt/llvm/bin:$PATH"' >> ~/.zshrc
#
# For compilers to find llvm you may need to set:
#   export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
#  export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
