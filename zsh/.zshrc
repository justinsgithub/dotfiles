export PATH=$PATH:/usr/local/go/bin:/home/justin/.local/bin:/home/justin/bin/nvim-linux64/bin

export PATH=/usr/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="frisk"

CASE_SENSITIVE="true"

plugins=( sudo copydir copybuffer copyfile fzf colorize colored-man-pages zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

hash -d docs=$HOME/docs

hash -d myself=$HOME/myself
  
hash -d eztext=$HOME/eztezt

alias quicknote="vim $HOME/myself/quicknotes.md"

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

alias zshconfig="vim ~/.zshrc; zsh"

alias mkserve="mkdocs serve"

alias mkbuild="mkdocs build"

alias vimconfig='vim ~/.config/nvim/init.vim'

alias correctspelling="vim ~/.config/nvim/lua/user/common-misspellings.lua"

alias svimconfig='vim ~/.SpaceVim.d/init.toml'

alias weztermconfig="vim ~/.wezterm.lua"

alias promptconfig="vim ~/.config/zsh/.oh-my-zsh/custom/themes/my.zsh-theme"

alias linode="ssh example_user@0.0.0.0"

alias rustdocs="rustup docs --book"

alias install="sudo apt-get --install-suggests -y $@"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/justin/bin/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/justin/bin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/justin/bin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/justin/bin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
