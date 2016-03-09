

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
call yankstack#setup()


" Rails.vim
let g:rails_ctags_arguments = '--fields=+l'


" vim-move
let g:move_key_modifier = 'S'


" Goyo
nmap <silent> <leader>g :Goyo<CR> 


" SuperTab
let g:SuperTabDefaultCompletionType = 'context'
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \ endif

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline_theme = 'base16'
