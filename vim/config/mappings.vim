" Move by screen lines instead of file lines.
" http://vim.wikia.com/wiki/Moving_by_screen_lines_instead_of_file_lines
noremap <Up> gk
noremap <Down> gj
noremap k gk
noremap j gj
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Vertical split then hop to new buffer
noremap <leader>v :vsplit<CR><c-w>l
noremap <leader>h :split<CR><c-w>j

" Switch between tabs/spaces for indentation
nnoremap <leader>s :set expandtab!<CR>

" Make ,l clear the highlight as well as redraw
nnoremap <leader>l :nohls<CR><C-L>
inoremap <leader>l <C-O>:nohls<CR>

" Toggle invisible chars
noremap <leader>i :set list!<CR>

" Insert new lines without going into insert mode
map <Enter> o<ESC>
map <S-Enter> O<ESC>
" Also map <Leader><Enter> for Terminal Vim
map <leader><Enter> O<ESC>

" Yank to OS X clipboard
noremap <leader>y "*y

" Paste from OS X clipboard without messing up indent
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>

" Duplicate text (in Visual mode)
vnoremap <leader>d y'>p

" Select the text that was last edited/pasted.
" http://vimcasts.org/episodes/bubbling-text/
nmap gV `[v`]

" Shift + left/right to switch tabs.
noremap <silent> <S-Left> :tabp<CR>
noremap <silent> <S-Right> :tabn<CR>

" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" Keep block selection after indentation
vnoremap < <gv
vnoremap > >gv

" Use 'very magic' search by default
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" These rely on the vim-unimpaired plugin.
  " Move single lines.
  nmap <C-Up> [e
  nmap <C-Down> ]e
  " Move multiple lines.
  vmap <C-Up> [egv
  vmap <C-Down> ]egv

" Make shift-arrow keys work in tmux
if exists('$TMUX')
  map [1;2D <S-Left>
  map [1;2C <S-Right>
endif

" Force save files that require root permission
cmap w!! %!sudo tee > /dev/null %
