set nocompatible
let mapleader = ","
let maplocalleader = mapleader

" NeoBundle for plugin management.
" https://github.com/Shougo/neobundle.vim
" filetype off and then on again afterwards for ftdetect files to work properly.
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
source ~/.vim/config/plugins.vim
call neobundle#end()

" Load plugin and indent settings for the detected filetype.
filetype plugin indent on

" Prompt to install new bundles
NeoBundleCheck

" yankstack needs to be initialized before any mappings, etc
call yankstack#setup()


" .vimrc split into separate files

source ~/.vim/config/autocommands.vim
source ~/.vim/config/settings.vim
source ~/.vim/config/mappings.vim
source ~/.vim/config/statusline.vim


" Snippets that are too long for .vimrc, too short for plugins


" Host-specific config

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
