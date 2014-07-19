# dotvim

My vim config. 

## Install

Clone to `~/.vim/` and run `./setup.sh` (it should (hopefully) back up your existing `~/.vimrc`):

```
git clone https://github.com/garrett/dotvim.git ~/.vim/ && cd ~/.vim/ && ./setup.sh && cd -
```

## Add a plugin

Plugins are handled by pathogen and git.

You can add a plugin as a submodule in the bundle dir like so:
`git submodule add git://github.com/tpope/vim-fugitive.git bundle/fugitive`


### More info

More information on this technique is available at:

* http://mirnazim.org/writings/vim-plugins-i-use/
* http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/


## Update plugins

Run `./update.sh` to update all plugins to the latest version.
