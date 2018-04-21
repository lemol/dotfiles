install_neovim() {
  if [ ! -n "$NVIMD" ]; then
    NVIMD=~/.config/nvim
  fi

  if [ ! -n "$NVIMRC" ]; then
    NVIMRC=$NVIMD/init.vim
  fi

  mkdir -p $NVIMD

  if [ -f "$NVIMRC" ]; then
    mv "$NVIMRC" "$BACKUP"
    echo -e "Created backup for $NVIMRC.\n"
  fi

  echo "neovim"
  export NVIMD
  export NVIMRC
  export BASE
  $BASE/vim/install.sh
}

install_X() {
  XRESOURCES=~/.Xresources

  if [ -f "$XRESOURCES" ]; then
    if [ "$(readlink $XRESOURCES)" =~ "$BASE/X/.Xresources" ]; then
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
  
  XDEFAULTS=~/.Xdefaults

  if [ -f "$XDEFAULTS" ]; then
    if [ "$(readlink $XDEFAULTS)" =~ "$BASE/X/.Xdefaults" ]; then
      echo -e "X is already configured to use dotfiles.\n"
    else
      mv "$XDEFAULTS" "$BACKUP"
      echo -e "Created backup for $XDEFAULTS.\n"
      ln -s "$BASE/vim/.Xdefaults" "$XDEFAULTS"
      echo -e "Installed X with $XDEFAULTS.\n"
    fi
  else
    ln -s "$BASE/vim/.Xdefaults" "$XDEFAULTS"
    echo -e "Installed X with $XDEFAULTS.\n"
  fi
}

install_zsh() {
  ZSHRC=~/.zshrc

  if [ -f "$ZSHRC" ]; then
    if [ "$(readlink $ZSHRC)" =~ "$BASE/zsh/.zshrc" ]; then
      echo -e "zsh is already configured to use dotfiles.\n"
    else
      mv "$ZSHRC" "$BACKUP"
      echo -e "Created backup for $ZSHRC.\n"
      ln -s "$BASE/zsh/.zshrc" "$ZSHRC"
      echo -e "Installed zsh with $ZSHRC.\n"
    fi
  else
    ln -s "$BASE/zsh/.zshrc" "$ZSHRC"
    echo -e "Installed zsh with $ZSHRC.\n"
  fi
}

install_tmux() {
  TMUXCONF=~/.tmux.conf

  if [ -f "$TMUXCONF" ]; then
    if [ "$(readlink $TMUXCONF)" =~ "$BASE/tmux/.tmux.conf" ]; then
      echo -e "tmux is already configured to use dotfiles.\n"
    else
      mv "$TMUXCONF" "$BACKUP"
      echo -e "Created backup for $TMUXCONF.\n"
      ln -s "$BASE/tmux/.tmux.conf" "$TMUXCONF"
      echo -e "Installed tmux with $TMUXCONF.\n"
    fi
  else
    ln -s "$BASE/tmux/.tmux.conf" "$TMUXCONF"
    echo -e "Installed tmux with $TMUXCONF.\n"
  fi
}

main() {

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

  printf "Cloning from github...\n"
  hash git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    exit 1
  }

  env git clone --depth=1 https://github.com/lemol/dotfiles.git $BASE || {
    printf "Error: git clone of dotfiles repo failed\n"
    exit 1
  }

  mkdir -p "$BACKUP"

  printf "Configuring neovim\n"
  install_neovim
  
  #printf "Configuring X\n"
  #install_X

  printf "Configuring ZSH\n"
  install_zsh
  
  #printf "Configuring TMUX\n"
  #install_tmux
  
  echo -e "DONE.\n"
  env zsh
}

main
