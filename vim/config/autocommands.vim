if has("autocmd")

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
  au FileType markdown noremap <F5> :!open -a "Google Chrome" %<CR>

  " Close help windows with just q
  au FileType HELP map <buffer> q :q<CR>

endif
