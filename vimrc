set nocompatible
let mapleader = ","
let maplocalleader = mapleader


" NeoBundle for plugin management
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load plugin and indent settings for the detected filetype.
filetype plugin indent on


" .vimrc split into separate files
source ~/.vim/config/autocommands.vim
source ~/.vim/config/commands.vim
source ~/.vim/config/mappings.vim
source ~/.vim/config/plugins.vim
source ~/.vim/config/settings.vim


" Host-specific config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
