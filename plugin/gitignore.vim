let s:filename = '.gitignore'
if filereadable(s:filename)
    let s:igstring = ''
    for s:oline in readfile(s:filename)
        let s:line = substitute(s:oline, '\s|\n|\r', '', "g")
        if s:line =~ '^#' | con | endif
        if s:line == '' | con  | endif
        if s:line =~ '^!' | con  | endif
        if s:line =~ '/$' | let s:igstring .= "," . s:line . "*" | con | endif
	if s:line !~ '\*' | con | endif
        let s:igstring .= "," . s:line
    endfor
    let s:execstring = "set wildignore=".substitute(s:igstring, '^,', '', "g")
    execute s:execstring
endif
