function! denite_settings#my_settings() abort
    call s:DeniteOptions()
endfunction


function! s:DeniteOptions() abort
    call denite#custom#source('file/rec', 'matchers',
                \['matcher/fuzzy', 'matcher/ignore_globs'])
    call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
        \['.git/', '.svn/', '.DS_Store', '.metadata/', '*.log', 
        \ 'lib/'])
endfunction
