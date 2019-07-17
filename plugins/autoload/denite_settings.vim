function! denite_settings#my_settings() abort
    call s:DeniteOptions()
endfunction

function! s:DeniteOptions() abort
    call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
        \['.git/', 'svn/', '.DS_Store', '.metadata/'])
endfunction
