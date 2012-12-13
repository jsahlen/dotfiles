" My own bundles
Bundle 'jsahlen/hammer.vim'
Bundle 'jsahlen/vim-snipmate-snippets'
Bundle 'jsahlen/vim-tomorrow-theme'
" GitHub bundles
Bundle 'bbommarito/vim-slim'
Bundle 'ervandew/supertab'
Bundle 'garbas/vim-snipmate'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'mileszs/ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/vitality.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'triglav/vim-visual-increment'
Bundle 'vim-ruby/vim-ruby'
Bundle 'wincent/Command-T'
" Vim.org bundles
Bundle 'IndexedSearch'
Bundle 'L9'
Bundle 'matchit.zip'


" NERDTree
noremap <leader>n :NERDTreeToggle<CR>
autocmd FileType nerdtree setlocal nolist
let NERDTreeMouseMode=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1


" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
let g:syntastic_javascript_checker="jshint"
let g:syntastic_jsl_conf="~/.jsl.conf"
let g:syntastic_disabled_filetypes=['html']


" CommandT
nmap <silent> <leader>t :CommandT<CR>
nmap <silent> <leader>T :CommandTFlush<CR>:CommandT<CR>
let g:CommandTAcceptSelectionTabMap=['<C-t>','<S-CR>']
let g:CommandTCancelMap=['<ESC>', '<C-c>']
let g:CommandTMatchWindowAtTop=1
set wildignore=.git,tmp,*.png,*.jpg,*.gif,*.psd,node_modules/*

" Hammer
let g:HammerQuiet=1
let g:HammerTemplate="jsahlen"


" yankstack
let g:yankstack_map_keys = 0
nmap <C-p> <Plug>yankstack_substitute_older_paste
