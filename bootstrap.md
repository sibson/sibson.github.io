
# Base utilities

## MacOS

```sh
# Build tools
xcode-select --install

# Homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> $HOME/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Dev tools
brew install asdf
echo '. /opt/homebrew/opt/asdf/libexec/asdf.sh' >> $HOME/.zprofile
source $HOME/.zprofile
```

## Linux
```sh
sudo apt-get install -y git curl vim zsh vim
chsh -s /bin/zsh
```

# Shell Environment Configuration
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# Dotfiles
# https://www.atlassian.com/git/tutorials/dotfiles
```sh
git clone --bare git@github.com:sibson/dotfiles.git $HOME/.dotfiles
alias gitdot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
gitdot checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    mkdir -p .dotfiles-backup
    gitdot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
gitdot checkout
gitdot config status.showUntrackedFiles no
```

# Python

## MaxOS

## Liunx
```sh
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncursesw5-dev xz-utils libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```
# Common
```
asdf plugin add python
asdf install python latest
asdf global python latest
```
