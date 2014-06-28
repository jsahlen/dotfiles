" My own bundles
Bundle 'jsahlen/vim-snipmate-snippets'
Bundle 'jsahlen/vim-tomorrow-theme'
" GitHub bundles
Bundle 'chriskempson/base16-vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'ervandew/supertab'
Bundle 'evidens/vim-twig'
Bundle 'garbas/vim-snipmate'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'mattn/emmet-vim'
Bundle 'matze/vim-move'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
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
Bundle 'tpope/vim-vinegar'
Bundle 'triglav/vim-visual-increment'
Bundle 'vim-ruby/vim-ruby'
Bundle 'xenoterracide/html.vim'
" Vim.org bundles
Bundle 'gitignore'
Bundle 'IndexedSearch'
Bundle 'L9'
Bundle 'matchit.zip'


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
