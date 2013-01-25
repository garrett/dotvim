#!/bin/sh

VIMRC="$HOME/.vimrc"

if [ -f $VIMRC ] && [ ! -L $VIMRC ]
then
  mv $VIMRC $VIMRC-old-`date +%Y%m%d`
fi

# Set up symlink
ln -sf `pwd`/vimrc $VIMRC

# Check out submodules
git submodule init && git submodule update

which ctags &> /dev/null || echo "You need to install ctags: yum install -y ctags"
