" NeoBundle Preamble
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

let repos = ['https://github.com/vim-scripts/bufkill.vim', 
            \ 'https://github.com/flazz/vim-colorschemes',
            \'https://github.com/scrooloose/nerdtree',
            \'https://github.com/klen/python-mode',
            \'https://github.com/tomtom/tlib_vim',
            \'https://github.com/marcweber/vim-addon-mw-utils',
            \'https://github.com/garbas/vim-snipmate',
            \'https://github.com/honza/vim-snippets',
            \'https://github.com/Yggdroot/indentLine',
            \'https://github.com/Lokaltog/vim-easymotion',
            \'https://github.com/tomtom/tcomment_vim',
            \]

for repo in repos
    call neobundle#bundle(repo)
endfor

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"" Stuff that's independent of plugins
" VIM Python IDE Stuff
syntax on
set foldmethod=indent
set foldlevel=99

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set completeopt=longest,menuone,preview

autocmd BufWritePost *.pyx !make build
autocmd BufWritePost *.pxd !make build

" Tab based stuff
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set tw=79
set fo+=t
au FileType python set fo+=t

" Other indents
set autoindent
set smartindent

" Mac Section
if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin"
        set macmeta
        set guifont=Anonymous\ Pro\ for\ Powerline:h12'
    else
        set guifont=Terminus\ 9
    endif
endif

" Misc
set ruler
set autoread

set showmatch
set hlsearch
set backspace=2
set incsearch
set guioptions-=l
set guioptions-=r
set guioptions-=L
set guioptions-=R
set guicursor+=a:blinkon0

set wildmode=longest,list,full " normal tab completion
set wildmenu

set laststatus=2

set statusline=[%m%t]\       "modified? tail of the filename
set statusline+=[%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file


"" Plugin stuff

" NERDTree
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.pyc$']

" Colorscheme - GVim only
if has("gui_running")
    set number
    colorscheme kib_darktango
    hi link EasyMotionTarget Identifier
endif

" IndentLine
set list lcs=tab:\┊\ 

let g:indentLine_indentLevel = 4
let g:indentLine_char = "┊"
let g:indentLine_color_gui = "gray30"

" Pymode
let g:pymode_rope_always_show_complete_menu = 1
let g:pymode_indent = 1
let g:pymode_syntax_space_errors = 0
let g:pymode_lint_checkers = ["pylint"]
let g:pymode_lint_ignore = 'C0103,C0111,E1101,R0901,R0902,R0903,R0904,R0913,R0915,W0141,W0142,
            \W0221,W0232,W0401,W0613,W0631,W0703,I0011,W0403,R0914,W0110,C0330,C0326,F0401'
let g:pymode_lint_unmodified = 1
let g:pymode_options_colorcolumn = 0
" let g:pymode_paths = [$HOME . "/anaconda/lib/python2.7", $HOME . "/anaconda/lib/python2.7/site-packages"]
" let g:pymode_rope_complete_on_dot = 0
