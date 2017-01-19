#!/bin/sh

INSTALL_DIR="$NVIMD/repos/github.com/Shougo/dein.vim"

echo "Install dein to $INSTALL_DIR..."
if [ -e "$INSTALL_DIR" ]; then
  echo "\"$INSTALL_DIR\" already exists!"
fi

echo ""

# make plugin dir and fetch dein
if ! [ -e "$INSTALL_DIR" ]; then
  echo "Begin fetching dein..."
  git clone https://github.com/Shougo/dein.vim "$INSTALL_DIR"
  echo "Done."
  echo ""
fi

# write initial setting for .vimrc
cat <<EOF >$NVIMDRC
"Init Scripts-----------------------------
if &compatible
  set nocompatible               \" Be iMproved
endif

" Required:
set runtimepath+=$INSTALL_DIR

" Required:
call dein#begin('$NVIMD')

source $BASE/vim/init.vim

"End Init Scripts-------------------------
EOF

echo "Complete setup dein!"
