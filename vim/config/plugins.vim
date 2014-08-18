" My own bundles
NeoBundle 'jsahlen/vim-snipmate-snippets'
NeoBundle 'jsahlen/vim-tomorrow-theme'
" GitHub bundles
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'ervandew/supertab'
NeoBundle 'evidens/vim-twig'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'godlygeek/tabular'
NeoBundle 'groenewege/vim-less'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'matze/vim-move'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjl/vitality.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rbenv'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'triglav/vim-visual-increment'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'xenoterracide/html.vim'
" Vim.org bundles
NeoBundle 'gitignore'
NeoBundle 'IndexedSearch'
NeoBundle 'L9'
NeoBundle 'matchit.zip'


" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html'] }


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
nmap <silent> <leader>b :CtrlPBuffer<CR>

let g:ctrlp_status_func = {
  \ 'main': 'CtrlP_Statusline_1',
  \ 'prog': 'CtrlP_Statusline_2'
\ }

let g:ctrlp_root_markers = ['Gemfile', '*.csproj', 'package.json']
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\v\.(png|jpg|gif|psd)$'
\ }


" yankstack
let g:yankstack_map_keys = 0
nmap <C-p> <Plug>yankstack_substitute_older_paste


" Rails.vim
let g:rails_ctags_arguments = '--fields=+l'


" vim-move
let g:move_key_modifier = 'S'
