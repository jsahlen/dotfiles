set encoding=utf-8

syntax on                        " Enable syntax highlighting
"set t_Co=256                     " Use 256-color mode in terminals
set background=dark              " Some plugins need to know this
colorscheme base16-ocean         " Default colorscheme
hi Comment cterm=italic

set backspace=indent,eol,start   " Allow backspacing over everything in insert mode
set number                       " Show line numbers
set visualbell                   " Don't beep
set hidden                       " Hide buffers when not displayed
set mouse=a                      " Enable mouse
set nowrap                       " Don't wrap lines
set completeopt=longest,menu     " Bash-style command completion
set wildmenu                     " Show completion menu when tabbing in command mode
set wildmode=list:longest,list:full " Show the completion menu
set showcmd                      " Show partial command in the last line of the screen
set laststatus=2                 " Always show the statusline
set equalalways                  " Multiple windows, when created, are equal in size
set ttyfast                      " Indicate a fast terminal connection
set colorcolumn=80               " Highlight the 80th column

if has("patch-7.4.338")
  set breakindent                " Indent wrapped code
end

" Scrollbars
set scrolloff=3                  " Minimal number of lines to show above/below the cursor
set sidescrolloff=5              " Minimal number of columns to show to the right/left of the cursor
set sidescroll=1                 " Minimal number of columns to scroll horizontally
set numberwidth=4                " Minimal number of columns to use for the line number
set cursorline                   " Highlight cursor line

" Invisibles
set listchars=tab:‣\ ,trail:•,eol:¬ " Define how invisible characters are displayed
set list                         " Show invisibles by default

" Indentation
set tabstop=2                    " With of a tab character
set softtabstop=2                " Width of soft tabs (number of spaces to insert)
set shiftwidth=2                 " Number of spaces to insert when auto-indenting
set expandtab                    " Use soft tabs (spaces) by default
set smarttab                     " Be smart about inserting spaces when hitting <Tab>
set autoindent                   " Automatically set the indent of a new line based on the previous one

" Searching
set hlsearch                     " Highlight results
set incsearch                    " Search-as-you-type
set ignorecase                   " Ignore case…
set smartcase                    " …but not if an uppercase character is used

" Hide away backup and swap files
set backupdir=~/.vim/backup
set directory=~/.vim/backup


" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence.
" https://gist.github.com/1195581
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
