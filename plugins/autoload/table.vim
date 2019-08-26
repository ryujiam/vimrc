function! table#CreateTable(...) abort
    if &ft != 'markdown' || a:0 <= 1 && a:0 > 2
        echo 'need to two parameters or to be markdown of filetype'
        return 
    endif

    let first_pos = getpos('.')
    let row_pos = first_pos[1]

    let col = a:1
    let row = a:2
    call s:create_header(col, row_pos)
    call s:create_data(row, col, row_pos + 2)
    call setpos('.', first_pos)
    exe ':TableFormat'
endfunction

function s:init() abort
    let s:first_pos = getpos('.')
endfunction

function s:create_header(col, cur_row) abort
    call s:append_row(a:cur_row, a:col)
    call s:append_row(a:cur_row + 1, a:col)
endfunction

function s:create_data(row, col, cur_row) abort
    let next_row = a:cur_row
    for i in range(a:row)
        call s:append_row(next_row, a:col)
        let next_row += 1
    endfor
endfunction

function s:append_row(row_pos, col) abort
    let cell = ''
    for i in range(a:col + 1)
        let cell = cell . '|'
    endfor
    call append(a:row_pos - 1, cell)
endfunction
