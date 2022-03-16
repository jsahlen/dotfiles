function s:AdjustColorScheme()
  let g:colors_name = get(g:, "colors_name", "")

  " Use terminal emulator's background color
  hi Normal ctermbg=NONE guibg=NONE

  " Don't underline the cursor line
  hi CursorLine term=NONE cterm=NONE

  " Show comments as italic if terminal supports it
  if $TERM =~ "-italic"
    hi Comment cterm=italic gui=italic
  endif

  " coc.nvim signs
  if exists('g:plugs["coc.nvim"]')
    highlight clear CocErrorSign
    highlight clear CocWarningSign
    highlight clear CocInfoSign
    highlight clear CocHintSign
    highlight link CocErrorSign ALEErrorSign
    highlight link CocWarningSign ALEWarningSign
    highlight link CocInfoSign ALEInfoSign
  endif
endfunction

if has("autocmd")
  " Do some adjustments to the colorscheme
  au ColorScheme * call s:AdjustColorScheme()

  " Remember last location in file, but not for commit messages.
  au BufReadPost * if &filetype !~ 'commit\c' && line("'\"") > 0 && line("'\"") <= line("$")
     \| exe "normal g'\"" | endif

  " Use spaces for most files, but real tabs for some
  au FileType *    set expandtab
  au FileType php  set noexpandtab

  " These files are also HTML
  au BufRead,BufNewFile *.{jst,cshtml} set ft=html

  " These files are also Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,Vagrantfile,Guardfile,config.ru} set ft=ruby

  " These files are also Markdown
  au BufRead,BufNewFile *.{md,mdown,mkd,mkdn} set ft=markdown
  au FileType markdown noremap <silent> <F5> :silent !open -a "Google Chrome" "%"<CR>

  " Close help windows with just q
  au FileType help noremap <buffer> q :q<CR>

  " FZF
  au FileType fzf set laststatus=0 noshowmode noruler signcolumn=no
     \| au BufLeave <buffer> set laststatus=2 showmode ruler
  au FileType list set laststatus=0 noshowmode noruler signcolumn=no
     \| au BufLeave <buffer> set laststatus=2 showmode ruler
endif
