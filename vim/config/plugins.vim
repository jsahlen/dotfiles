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
  let g:neosnippet#snippets_directory='~/.vim/snippets'
endif


" neoterm
if exists('g:plugs["neoterm"]')
  nnoremap <silent> <leader>e :Ttoggle<CR>
endif


" completor.vim
if exists('g:plugs["completor.vim"]')
  let g:completor_auto_trigger = 0

  let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
  let g:completor_scss_omni_trigger = g:completor_css_omni_trigger
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
  let g:fzf_command_prefix = 'Fzf'
  let g:fzf_prefer_tmux = 0
  let g:fzf_layout = { 'down': '~40%' }

  let s:fzf_rg_options = { 'options': '--no-hscroll --delimiter : --nth 1,3' }

  command! -bang -nargs=* FzfRg
    \ call fzf#vim#grep(
    \   'rg --line-number --no-heading --color=always '.shellescape(<q-args>),
    \   0,
    \   <bang>0 ? fzf#vim#with_preview(s:fzf_rg_options, 'up:61%')
    \           : fzf#vim#with_preview(s:fzf_rg_options, 'right:50%:hidden', '?'),
    \   <bang>0)

  command! -bang -nargs=? -complete=dir FzfFiles
    \ call fzf#vim#files(
    \   <q-args>,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

  nmap <silent> ;         :FzfBuffers<CR>
  nmap <silent> <leader>t :FzfFiles<CR>
  nmap <silent> <leader>r :FzfTags<CR>
  nmap <silent> <leader>a :FzfRg<CR>
endif


" ALE
if exists('g:plugs["ale"]')
  let g:ale_echo_delay = 300
  let g:ale_lint_delay = 100
  let g:ale_lint_on_text_changed = 'normal'
  let g:ale_lint_on_insert_leave = 1
  let g:ale_sign_column_always = 1
  let g:ale_sign_error = "✖"
  let g:ale_sign_warning = "▲"
  let g:ale_linters_explicit = 1

  let g:ale_linters = {
  \  'javascript': ['eslint'],
  \  'ruby': ['standardrb'],
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

" vim-bufkill
if exists('g:plugs["vim-bufkill"]')
  let g:BufKillCreateMappings = 0
  nnoremap <silent> <Leader>d :BD<CR>
  nnoremap <silent> <Leader>D :bd<CR>
endif

" CtrlSF
if exists('g:plugs["ctrlsf.vim"]')
  let g:ctrlsf_ackprg = 'rg'
  let g:ctrlsf_auto_focus = {
    \   "at": "start"
    \ }
  let g:ctrlsf_position = 'right'
  let g:ctrlsf_regex_pattern = 1

  " Alias
  command! -n=* -comp=customlist,ctrlsf#comp#Completion Ack CtrlSF <args>
endif

" CoC
if exists('g:plugs["coc.nvim"]')
  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> for trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  let g:coc_snippet_next = '<TAB>'
  let g:coc_snippet_prev = '<S-TAB>'

  " Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  " vim-endwise interferes with our <CR> mapping
  if exists('g:plugs["vim-endwise"]')
    let g:endwise_no_mappings=1
  endif

  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

  " Use `[c` and `]c` for navigate diagnostics
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
endif

" UltiSnips
if exists('g:plugs["ultisnips"]')
  let g:UltiSnipsExpandTrigger = "<f9>"
  let g:UltiSnipsListSnippets = "<c-f9>"
  let g:UltiSnipsJumpForwardTrigger = "<s-f9>"
  let g:UltiSnipsJumpBackwardTrigger = "<c-s-f9>"
endif
