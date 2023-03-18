# stow-files

stow is a tool to manage your dot files, must be installed first

stow */

stow $FOLDER-NAME

## install common dependencies (debian based)

```
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

sudo apt install stow curl zsh ripgrep fzf python3-pygments golang-chroma git git-filter-repo build-essential xsel pip gcc make libc6=2.34-0ubuntu3  libc6-dev g++

sudo pip install pynvim

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

nvm install node

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo apt-get install software-properties-common

sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt-get update && sudo apt-get install neovim

sudo apt-get install python-dev python3-dev python3-pip

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cargo install stylua

npm install -g eslint prettier typescript typescript-language-server neovim emmet-ls ls_emmet

sudo pip install flake8 black
```
