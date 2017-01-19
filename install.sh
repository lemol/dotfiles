install_neovim () {
  if [ ! -n "$NVIMD" ]; then
    NVIMD=~/.config/nvim
  fi

  if [ ! -n "$NVIMRC" ]; then
    NVIMRC=$NVIMD/init.vim
  fi

  mkdir -p $NVIMD

  if [[ -f "$NVIMRC" ]]; then
    mv "$NVIMRC" "$BACKUP"
    echo -e "Created backup for $NVIMRC.\n"
  fi

  $BASE/vim/install.sh
}

install_X () {
  XRESOURCES=~/.Xresources

  if [[ -f "$XRESOURCES" ]]; then
    if [[ "$(readlink $XRESOURCES)" =~ "$BASE/X/.Xresources" ]]; then
      echo -e "X is already configured to use dotfiles.\n"
    else
      mv "$XRESOURCES" "$BACKUP"
      echo -e "Created backup for $XRESOURCES.\n"
      ln -s "$BASE/vim/.Xresources" "$XRESOURCES"
      echo -e "Installed X with $XRESOURCES.\n"
    fi
  else
    ln -s "$BASE/vim/.Xresources" "$XRESOURCES"
    echo -e "Installed X with $XRESOURCES.\n"
  fi
}

main() {

  # Only enable exit-on-error after the non-critical colorization stuff,
  # which may fail on systems lacking tput or terminfo
  set -e

  if [ ! -n "$BASE" ]; then
    BASE=~/.files
  fi

  if [ ! -n "$BACKUP" ]; then
    BACKUP=~/.files_back
  fi

  if [ -d "$BASE" ]; then
    printf "The $BASE directory exists, it looks like you have already installed my .dotfiles.\n"
    printf "If you want to reinstall please remove $BASE.\n"
    exit
  fi

  printf "Cloning from github..."
  hash git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    exit 1
  }

  env git clone --depth=1 https://github.com/lemol/dotfiles.git $BASE || {
    printf "Error: git clone of dotfiles repo failed\n"
    exit 1
  }

  mkdir -p "$BACKUP$"

  printf "Configuring neovim\n"
  install_neovim
  printf "Configuring X\n"
  install_X

  echo -e "DONE.\n"
  env zsh
}

main
