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
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'mattn/emmet-vim'
Bundle 'matze/vim-move'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
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
Bundle 'IndexedSearch'
Bundle 'L9'
Bundle 'matchit.zip'


" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html'] }


" Unite.vim
let s:unite_ignores = [
  \ '\(^\|/\)\(\.sass-cache\|node_modules\|Thumbs\.db\)',
  \ '\.\(jpg\|png\|gif\|ico\|svg\|eot\|ttf\|woff\|swf\)$']

call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
  \ 'ignore_pattern', unite#get_all_sources('file_rec')['ignore_pattern'] . '\|' .
  \ join(s:unite_ignores, '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nmap <silent> <leader>t :Unite file_rec/async -buffer-name=files -start-insert -sync<cr>
nmap <silent> <leader>b :Unite -buffer-name=buffers -no-split buffer<cr>
if executable('ag')
  nmap <leader>a :Unite -buffer-name=ag grep:
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --hidden'
  let g:unite_source_grep_recursive_opt = ''
endif
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Close with <esc>
  nmap <buffer> <silent> <esc> <Plug>(unite_exit)
endfunction


" yankstack
let g:yankstack_map_keys = 0
nmap <C-p> <Plug>yankstack_substitute_older_paste
" Rails.vim
let g:rails_ctags_arguments = '--fields=+l'


" vim-move
let g:move_key_modifier = 'S'
