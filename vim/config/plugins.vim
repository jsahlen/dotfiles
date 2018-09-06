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
  let g:move_map_keys = 0

  nmap <S-j> <Plug>MoveLineDown
  nmap <S-k> <Plug>MoveLineUp
  vmap <S-j> <Plug>MoveBlockDown
  vmap <S-k> <Plug>MoveBlockUp
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
  let g:airline#extensions#tabline#show_tab_type = 0

  let g:airline_theme = 'oceanicnext'
endif


" tern
if exists('g:plugs["tern_for_vim"]')
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
  let g:neosnippet#disable_runtime_snippets = {
  \   '_' : 1,
  \ }
  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snipmate-snippets/snippets/'
endif


" neoterm
if exists('g:plugs["neoterm"]')
  nnoremap <silent> <leader>e :Ttoggle<CR>
endif


" Vimux
if exists('g:plugs["vimux"]')
  function! VimuxToggleRunner()
    if exists("g:VimuxRunnerIndex")
      call VimuxCloseRunner()
    else
      call VimuxOpenRunner()
    endif
  endfunction
  nnoremap <silent> <leader>e :call VimuxToggleRunner()<CR>
endif


" completor.vim
if exists('g:plugs["completor.vim"]')
  let g:completor_auto_trigger=0
endif


" completor.vim + Neosnippet
if exists('g:plugs["completor.vim"]') && exists('g:plugs["neosnippet.vim"]')
  imap <silent><expr><Tab>
     \ pumvisible() ? "\<C-n>"
     \ : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)"
     \ : (<SID>is_whitespace() ? "\<Tab>"
     \ : "<C-R>=completor#do('complete')<CR>"))

  smap <silent><expr><Tab>
     \ pumvisible() ? "\<C-n>"
     \ : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)"
     \ : (<SID>is_whitespace() ? "\<Tab>"
     \ : "<C-R>=completor#do('complete')<CR>"))

  imap <expr><S-Tab>
         \ pumvisible() ? "\<C-p>" : "\<C-h>"

  " vim-endwise interferes with our <CR> mapping
  if exists('g:plugs["vim-endwise"]')
    let g:endwise_no_mappings=1
    imap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>\<Plug>DiscretionaryEnd"
  else
    imap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
  endif

  function! s:is_whitespace() "{{{
    let col = col('.') - 1
    return ! col || getline('.')[col - 1] =~? '\s'
  endfunction "}}}
endif


" fzf
if exists('g:plugs["fzf.vim"]')
  let g:fzf_prefer_tmux = 1
  let g:fzf_layout = { 'down': '~40%' }

  nmap <silent> ;         :Buffers<CR>
  nmap <silent> <leader>t :Files<CR>
  nmap <silent> <leader>r :Tags<CR>
endif


" ALE
if exists('g:plugs["ale"]')
  let g:ale_sign_column_always = 1
  let g:ale_sign_error = "✖"
  let g:ale_sign_warning = "△"

  let g:ale_linters = {
  \  'html': [],
  \}

  if exists('g:plugs["vim-airline"]')
    let g:airline#extensions#ale#enabled = 1
  endif
endif

" vim-markdown
if exists('g:plugs["vim-markdown"]')
  let g:markdown_enable_spell_checking = 0
endif

" vim-jsx
if exists('g:plugs["vim-jsx"]')
  let g:jsx_ext_required = 0
endif

" ack.vim
if exists('g:plugs["ack.vim"]')
  let g:ackprg = 'ag --vimgrep'
  cnoreabbrev Ag Ack!
  cnoreabbrev Ack Ack!
  nnoremap <Leader>a :Ack!<Space>
  let g:ackhighlight = 1
  let g:ack_mappings = {
  \  '<C-t>': '<C-W><CR><C-W>T',
  \  '<C-x>': '<C-W><CR><C-W>K',
  \  '<C-v>': '<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t',
  \  'L': ':tabnext<CR>',
  \  'H': ':tabprev<CR>'
  \}
endif

" vim-bufkill
if exists('g:plugs["vim-bufkill"]')
  let g:BufKillCreateMappings = 0
  nnoremap <silent> <Leader>w :BD<CR>
endif
