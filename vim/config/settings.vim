set encoding=utf-8

syntax on                        " Enable syntax highlighting
set t_Co=256                     " Use 256-color mode in terminals
set background=dark              " Some plugins need to know this

" Colorscheme settings
let g:oceanic_next_terminal_italic = 1
let g:oceanic_next_terminal_bold = 1
colorscheme OceanicNext          " Default colorscheme

" Show comments as italic if terminal supports it
if $TERM =~ "-italic"
  hi Comment cterm=italic gui=italic
endif

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
set colorcolumn=80               " Highlight the 80th column
set lazyredraw                   " Lazy redraw for improved performance
if (has('breakindent'))
  set breakindent                " Indent wrapped code
endif
if (has('termguicolors'))        " Use 24-bit colors, if available
  set termguicolors
endif

" NeoVim-specific config
if has('nvim')
  let $NVIM_TERMINAL=1
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

" Scrollbars
set scrolloff=3                  " Minimal number of lines to show above/below the cursor
set sidescrolloff=5              " Minimal number of columns to show to the right/left of the cursor
set sidescroll=1                 " Minimal number of columns to scroll horizontally
set numberwidth=4                " Minimal number of columns to use for the line number
set cursorline                   " Highlight cursor line

" Invisibles
set listchars=tab:‣\ ,trail:•,eol:¬,nbsp:• " Define how invisible characters are displayed
set nolist                       " Show invisibles by default

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
