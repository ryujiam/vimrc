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
if has('unix') || has('mac')
    let s:conf_dir = expand($HOME. '/.config/nvim/')
    let g:pyenv_path = expand($PYENV_ROOT. '/shims/python')
elseif has('win64') || has('win32')
    let s:conf_dir = expand($LOCALAPPDATE. '/nvim/')
    let g:pyenv_path = expand($LOCALAPPDATE. '/Programs/Python/Python37/')
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

  let s:dein_conf_path = expand(s:conf_dir. '/dein.toml')
  let s:dein_lazy_conf_path = expand(s:conf_dir. '/deinlazy.toml')
  let s:dein_ft_conf_path = expand(s:conf_dir. '/deinft.toml')

  call dein#add(s:dein_dir)
  call dein#load_toml(s:dein_conf_path, {'lazy' : 0})
  call dein#load_toml(s:dein_lazy_conf_path, {'lazy' : 1})
  call dein#load_toml(s:dein_ft_conf_path)
  
  call dein#end()
  call dein#save_state()
endif

let g:python3_host_prog= g:pyenv_path

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
