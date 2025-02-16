#!/bin/bash

function print_sep {
  printf "\n"
  echo "---------- $1 -----------"
}
print_sep "Sudoing"
# sudo refresh
sudo -v
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

print_sep "Installing Homebrew"
if [[ $(command -v brew) == "" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    sudo chown -R $(whoami) /opt/homebrew
fi

print_sep "Installing Terminal tools"
print_sep "Installing git"
brew install git
brew install antigen
print_sep "Installing tmux"
brew install tmux
print_sep "Installing ripgrep"
brew install ripgrep
print_sep "Installing fzf"
brew install fzf
print_sep "Installing fd"
brew install fd
print_sep "Installing bat"
brew install bat
print_sep "Installing exa"
brew install exa
print_sep "Installing z"
brew install z
print_sep "Installing tldr"
brew install tldr
print_sep "Installing diff-so-fancy"
brew install diff-so-fancy
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
print_sep "Installing powerlevel10k"
brew install romkatv/powerlevel10k/powerlevel10k

print_sep "Installing DevOps tools"
print_sep "Installing terraform"
brew install terraform
print_sep "Installing awscli"
brew install awscli

print_sep "Installing GUI apps"
print_sep "Installing iterm2"
brew install --cask iterm2
print_sep "Installing visual-studio-code"
brew install --cask visual-studio-code
print_sep "Installing google-chrome"
brew install --cask google-chrome
print_sep "Installing notion"
brew install --cask notion
print_sep "Installing slack"
brew install --cask slack
#print_sep "Installing istat-menus"
#brew install --cask istat-menus
print_sep "Installing clipy"
brew install --cask clipy
print_sep "Installing karabiner-elements"
brew install --cask karabiner-elements
print_sep "Installing bettertouchtool"
brew install --cask bettertouchtool
print_sep "Installing whatsapp"
brew install --cask whatsapp
print_sep "Installing bartender"
brew install --cask bartender
# packages
# plugins
# config

#tmux
#mkdir -p /usr/local/bin
#sudo cp tmux/ide.sh /usr/local/bin/ide

# karabiner
#cp karabiner/*.json ~/.config/karabiner/assets/complex_modifications/

## git config
git config --global user.name "louiskim"
git config --global user.email louiskim.levu@gmail.com
## aliases
git config --global alias.a 'add --verbose'
git config --global alias.s 'status --untracked-files --short --branch'
git config --global alias.l 'log --oneline'
git config --global alias.sh 'show'
git config --global alias.d 'diff'
git config --global alias.co 'checkout'
git config --global alias.c 'commit'

## diff-so-fancy
# https://github.com/so-fancy/diff-so-fancy#usage
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"
