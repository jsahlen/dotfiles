" My own bundles
Bundle 'jsahlen/vim-snipmate-snippets'
Bundle 'jsahlen/vim-tomorrow-theme'
" GitHub bundles
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'ervandew/supertab'
Bundle 'garbas/vim-snipmate'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/vitality.vim'
Bundle 'slim-template/vim-slim'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'triglav/vim-visual-increment'
Bundle 'vim-ruby/vim-ruby'
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


" CtrlP

function! CtrlP_Statusline_1(focus, byfname, regex, prev, item, next, marked)
  " Arguments:
  " |
  " +- a:focus   : The focus of the prompt: "prt" or "win".
  " |
  " +- a:byfname : In filename mode or in full path mode: "file" or "path".
  " |
  " +- a:regex   : In regex mode: 1 or 0.
  " |
  " +- a:prev    : The previous search mode.
  " |
  " +- a:item    : The current search mode.
  " |
  " +- a:next    : The next search mode.
  " |
  " +- a:marked  : The number of marked files, or a comma separated list of
  "                the marked filenames.

  let a:statusline  = '[CtrlP] '
  let a:statusline .= 'mode:' . substitute(a:item, ' ', '', 'g') . ' '
  let a:statusline .= 'by:' . a:byfname . ' '
  let a:statusline .= 'regex:' . (a:regex ? 'on' : 'off') . ' '
  let a:statusline .= 'files:' . a:marked
  let a:statusline .= '%='
  let a:statusline .= ' [' . getcwd() . ']'

  return a:statusline
endfunction

function! CtrlP_Statusline_2(str)
  " a:str : Either the number of files scanned so far, or a string indicating
  "         the current directory is being scanned with a user_command.

  let a:statusline  = '[CtrlP] '
  let a:statusline .= '%2*' . a:str . '%*'
  let a:statusline .= '%='
  let a:statusline .= ' [' . getcwd() . ']'

  return a:statusline
endfunction

let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
nmap <silent> <leader>T :CtrlPClearCache<CR>:CtrlP<CR>

let g:ctrlp_status_func = {
  \ 'main': 'CtrlP_Statusline_1',
  \ 'prog': 'CtrlP_Statusline_2'
\ }

let g:ctrlp_root_markers = ['Gemfile']
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\v\.(png|jpg|gif|psd)$'
\ }

" Hammer
let g:HammerQuiet=1
let g:HammerTemplate="jsahlen"


" yankstack
let g:yankstack_map_keys = 0
nmap <C-p> <Plug>yankstack_substitute_older_paste
