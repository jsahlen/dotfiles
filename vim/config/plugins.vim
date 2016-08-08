" Neomake
if exists('g:plugs["neomake"]')
  let g:neomake_javascript_enabled_makers = ['eslint']
  autocmd! BufWritePost,BufEnter * Neomake
endif


" CtrlP
if exists('g:plugs["ctrlp.vim"]')
  let g:ctrlp_map = '<leader>t'
  let g:ctrlp_cmd = 'CtrlP'
  nmap <silent> <leader>T :CtrlPCurFile<CR>
  nmap <silent> <leader>b :CtrlPBuffer<CR>
  nmap <silent> <leader>c :CtrlPTag<CR>

  let g:ctrlp_root_markers = ['Gemfile', '*.csproj', 'package.json']
  let g:ctrlp_match_window_bottom = 0
  let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.git|\.hg|\.svn|node_modules)$',
    \ 'file': '\v\.(png|jpg|gif|psd)$'
  \ }

  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif


" yankstack
if exists('g:plugs["vim-yankstack"]')
  let g:yankstack_map_keys = 0
  nmap <C-p> <Plug>yankstack_substitute_older_paste
  call yankstack#setup()
endif


" Rails.vim
if exists('g:plugs["vim-rails"]')
  let g:rails_ctags_arguments = '--fields=+l'
endif


" vim-move
if exists('g:plugs["vim-move"]')
  let g:move_key_modifier = 'S'
endif


" Goyo
if exists('g:plugs["goyo.vim"]')
  nmap <silent> <leader>g :Goyo<CR> 
endif


" Airline
if exists('g:plugs["vim-airline"]')
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#tab_min_count = 2

  let g:airline_theme = 'oceanicnext'
endif


" base16 colorscheme
let g:base16_shell_path="~/.config/base16-shell"
if !has("nvim")
  let base16colorspace=256
endif

" Deoplete + Neosnippet
if exists('g:plugs["deoplete.nvim"]') && exists('g:plugs["neosnippet.vim"]')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#disable_auto_complete = 1
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif

  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

  imap <silent><expr><Tab>
     \ pumvisible() ? "\<C-n>"
     \ : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)"
     \ : (<SID>is_whitespace() ? "\<Tab>"
     \ : deoplete#mappings#manual_complete()))

  smap <silent><expr><Tab>
     \ pumvisible() ? "\<C-n>"
     \ : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)"
     \ : (<SID>is_whitespace() ? "\<Tab>"
     \ : deoplete#mappings#manual_complete()))

  inoremap <expr><S-Tab>
         \ pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:is_whitespace() "{{{
    let col = col('.') - 1
    return ! col || getline('.')[col - 1] =~? '\s'
  endfunction "}}}

  inoremap <expr><BS>
         \ deoplete#mappings#smart_close_popup()."\<C-h>"
  inoremap <expr><C-g>
         \ deoplete#mappings#undo_completion()

  augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  augroup end
endif

" tern
if exists('g:plugs["tern_for_vim"]') || exists('g:plugs["deoplete-ternjs"]')
  let g:tern_request_timeout = 1
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]

  nnoremap <silent> td :TernDef<CR>
  nnoremap <silent> tp :TernDefPreview<CR>
  nnoremap <silent> ts :TernDefSplit<CR>
  nnoremap <silent> tt :TernDefTab<CR>
  nnoremap <silent> tr :TernRefs<CR>
endif

" Neosnippets
if exists('g:plugs["neosnippet.vim"]')
  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snipmate-snippets/snippets/'
endif
