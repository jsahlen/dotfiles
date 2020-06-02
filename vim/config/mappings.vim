" Move by screen lines instead of file lines.
" http://vim.wikia.com/wiki/Moving_by_screen_lines_instead_of_file_lines
noremap <Up> gk
noremap <Down> gj
noremap k gk
noremap j gj
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Vertical split then hop to new buffer
noremap <Leader>v :vsplit<CR><C-w>l
noremap <Leader>h :split<CR><C-w>j

" Delete all buffers
noremap <silent> <Leader>bd :bufdo bdelete<CR>

" Switch between tabs/spaces for indentation
nnoremap <Leader>s :set expandtab!<CR>

" Make ,l clear the highlight as well as redraw
nnoremap <Leader>l :nohls<CR><C-L>
inoremap <Leader>l <C-O>:nohls<CR>

" Toggle invisible chars
noremap <Leader>i :set list!<CR>

" Insert new lines without going into insert mode
map <Enter> o<Esc>
map <S-Enter> O<Esc>
" Also map <Leader><Enter> for Terminal Vim
map <Leader><Enter> O<Esc>

" When yanking and pasting, jump to the end of the selection
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Yank to system clipboard
map <Leader>y "+y

" Paste from system clipboard without messing up indent
map <Leader>p :set paste<CR>"+p:set nopaste<CR>
map <Leader>P :set paste<CR>"+P:set nopaste<CR>

" Duplicate text (in Visual mode)
vmap <Leader>d y'>p

" Select the text that was last edited/pasted.
" http://vimcasts.org/episodes/bubbling-text/
nmap gV `[v`]

" Delete single character without placing it in the default register
" (keep X for the original purpose)
noremap x "_x
noremap X x

" Paste in visual mode without updating the default register
vnoremap p "_dP`]

" H/N to move between tabs
nnoremap <silent> L :tabnext<CR>
nnoremap <silent> H :tabprev<CR>

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

" Stop the stupid window from popping up
map q: :q

" Toggle checkboxes in markdown
nmap <silent> <Leader>x :ToggleCheckbox<CR>

" Show highlight group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Return to previous buffer from netrw
nnoremap <silent> _ :Rexplore<CR>
