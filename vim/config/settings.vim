set encoding=utf-8

syntax on                        " Enable syntax highlighting
set background=dark              " Some plugins need to know this

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Colorscheme settings
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let s:color_scheme = !empty($VIM_COLOR_SCHEME) ? $VIM_COLOR_SCHEME : "OceanicNext"
execute "colorscheme" fnameescape(s:color_scheme)

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
set novisualbell                 " Disable visual (flashing) bell
set breakindent                  " Indent wrapped code
if exists("&signcolumn")
  set signcolumn=yes             " Always show sign column
endif
set shortmess+=c                 " don't give |ins-completion-menu| messages.
set updatetime=300               " Smaller updatetime for CursorHold & CursorHoldI
if (has('termguicolors'))        " Use 24-bit colors, if available
  set termguicolors
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
if exists("&inccommand")
  set inccommand=nosplit
end

" Splits
set splitright                   " Vertical splits go on the right
set splitbelow                   " Horizontal splits go below

" Undo
set undofile

" Hide away backup and swap files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Neovim ruby path with rbenv
if has("nvim") && isdirectory($RBENV_ROOT)
  let rbenv_prefix = system('echo -n $(rbenv prefix $(rbenv global))')
  let g:ruby_host_prog = rbenv_prefix . '/bin/neovim-ruby-host'
end

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
