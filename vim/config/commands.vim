" Write file and delete buffer
command WriteDelete write|bdelete
cabbrev wd WriteDelete

" Toggle checkboxes (in Markdown)
function s:ToggleCheckbox()
  let l:unchecked_pattern = "\\[ \\]"
  let l:checked_pattern = "\\[x\\]"
  let l:line = getline('.')

  if l:line =~ l:unchecked_pattern
    let l:line = substitute(l:line, l:unchecked_pattern, "[x]", "")
  elseif l:line =~ l:checked_pattern
    let l:line = substitute(l:line, l:checked_pattern, "[ ]", "")
  endif

  call setline('.', l:line)
endfunction
command ToggleCheckbox call s:ToggleCheckbox()
