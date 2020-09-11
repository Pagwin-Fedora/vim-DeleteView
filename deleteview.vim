" Vim global plugin providing a command to delete the view of the current file
" Maintainer:	Spencer Powell <pagwin@pagwin.xyz>
" License:	This file is placed in the public domain.

if exists("g:loaded_DeleteView")
    finish
endif

function! MyDeleteView()
    let path = fnamemodify(bufname('%'),':p')
    " vim's odd =~ escaping for /
    let path = substitute(path, '=', '==', 'g')
    if empty($HOME)
    else
        let path = substitute(path, '^'.$HOME, '\~', '')
    endif
    let path = substitute(path, '/', '=+', 'g') . '='
    " view directory
    let path = &viewdir.'/'.path
    call delete(path)
    echo "Deleted: ".path
endfunction

command Delview call MyDeleteView()
