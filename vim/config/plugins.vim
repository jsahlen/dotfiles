" vim-move
if exists('g:plugs["vim-move"]')
  let g:move_map_keys = 0

  nmap <S-j> <Plug>MoveLineDown
  nmap <S-k> <Plug>MoveLineUp
  vmap <S-j> <Plug>MoveBlockDown
  vmap <S-k> <Plug>MoveBlockUp
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
  nmap <silent> <Leader>t :FzfFiles<CR>
  nmap <silent> <Leader>r :FzfTags<CR>
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
  let g:ctrlsf_mapping = {
    \   "open": ["<CR>", "O"],
    \   "openb": { "key": "o", "suffix": "<C-w>p" },
    \   "next": "n",
    \   "prev": "N"
    \ }

  nmap <Leader>a :CtrlSF<Space>
endif

" CoC
if exists('g:plugs["coc.nvim"]')
  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> for trigger completion.
  inoremap <silent><expr> <C-Space> coc#refresh()

  let g:coc_snippet_next = '<Tab>'
  let g:coc_snippet_prev = '<S-Tab>'

  " Use <CR> for confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  " vim-endwise interferes with our <CR> mapping
  if exists('g:plugs["vim-endwise"]')
    let g:endwise_no_mappings=1
  endif

  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

  " Use `[c` and `]c` for navigate diagnostics
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Other maps
  nmap <silent> <leader>rn <Plug>(coc-rename)
  nmap <silent> <leader>ef :CocCommand eslint.executeAutofix<CR>

  " Load extensions
  let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-eslint',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-snippets',
    \ 'coc-solargraph',
    \ 'coc-tsserver',
    \ ]
endif
