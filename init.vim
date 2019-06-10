"vi互換を無効
if &compatible
  set nocompatible
endif

"True Color
if has('nvim')
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	if (has("termguicolors"))
		set termguicolors
	endif
elseif has('patch-7.4.1778')
	set guicolors
endif
" Add the dein installation directory into runtimepath
let s:dein_cache_path = expand($HOME.'/.cache/nvim')
let s:dein_dir = s:dein_cache_path
	\ .'/repos/github.com/repos/github.com/Shougo/dein.vim'
set runtimepath+=dein_dir

if &runtimepath !~ '/dein.vim/'
	if !isdirectory(s:dein_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
	endif
	execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')
endif

if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  call dein#add($HOME.'/.cache/nvim/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml($HOME.'/.config/nvim/dein.toml', {'lazy' : 0})
  call dein#load_toml($HOME.'/.config/nvim/deinlazy.toml', {'lazy' : 1})
  call dein#load_toml($HOME.'/.config/nvim/deinft.toml')
  
  call dein#end()
  call dein#save_state()
endif

"let g:python_host_prog=''
"let g:python3_host_prog= expand('/Users/sakamotoryuuji/.pyenv/shims/python')
let g:python3_host_prog= expand($PYENV_ROOT.'/shims/python')

if dein#check_install()
	call dein#install()
endif

runtime! ./options.rc.vim
runtime! ./keymap.rc.vim
runtime! ./functions.rc.vim

"ポップアップ非表示
autocmd FileType python setlocal completeopt-=preview

filetype plugin indent on
syntax enable
