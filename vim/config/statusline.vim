set statusline=[%{GetName()}]\ 
set statusline+=%{&modified?'(modified)\ ':''}
set statusline+=%{IsHelp()}
set statusline+=%{&readonly?'(read-only)\ ':''}
set statusline+=%{strlen(StatuslineGitBranch())?'git:(':''}%{StatuslineGitBranch()}%{strlen(StatuslineGitBranch())?')\ ':''}%{StatuslineGitChanged()?'✗\ ':''}
set statusline+=fenc:%{strlen(&fenc)?&fenc:'none'}\ 
set statusline+=ff:%{&ff}\ 
set statusline+=ft:%{strlen(&ft)?&ft:'<none>'}\ 
set statusline+=ts:%{&expandtab?'spaces':'tabs'}\ 
set statusline+=%2*%{StatuslineTabWarning()}%*
set statusline+=%2*%{StatuslineTrailingSpaceWarning()}%*
set statusline+=%=
set statusline+=%{StatuslineCurrentHighlight()}\ 
set statusline+=col:%c\ 
set statusline+=line:%l\ 
set statusline+=total:%L

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

function! GetName()
  return expand('%')!=''?expand('%'):'none'
endfunction

function! IsHelp()
  return &buftype=='help'?'(help) ':''
endfunction

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
  if !exists("b:statusline_trailing_space_warning")
    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '\s '
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
  if exists("g:statusline_show_highlight") && g:statusline_show_highlight
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
      return ''
    else
      return '{' . name . '}'
    endif
  else
    return ''
  endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
  if !exists("b:statusline_tab_warning")
    let tabs = search('^\t', 'nw') != 0
    let spaces = search('^ ', 'nw') != 0

    if tabs && spaces
      let b:statusline_tab_warning =  '(mixed-indenting) '
"    elseif (spaces && !&et) || (tabs && &et)
"      let b:statusline_tab_warning = '[&et]'
    else
      let b:statusline_tab_warning = ''
    endif
  endif
  return b:statusline_tab_warning
endfunction

"return the current git branch and status
function! StatuslineGitBranch()
  if !exists("b:statusline_git_branch")
    let ref = system('git symbolic-ref HEAD 2> /dev/null | tr -d "[ \n]"')
    if ref != ''
      let b:statusline_git_branch = substitute(ref, "refs/heads/", "", "i")
    else
      let b:statusline_git_branch = ''
    endif
  endif

  return b:statusline_git_branch
endfunction

function! StatuslineGitChanged()
  if !exists("b:statusline_git_changed")
    let has_changes = system('git status -s 2> /dev/null')
    if has_changes != ''
      let b:statusline_git_changed = 1
    else
      let b:statusline_git_changed = 0
    endif
  endif

  return b:statusline_git_changed
endfunction

function! ResetStatuslineGit()
  unlet! b:statusline_git_branch
  unlet! b:statusline_git_changed
endfunction

autocmd bufread,cursorhold,bufwritepost,bufenter,focusgained * call ResetStatuslineGit()
