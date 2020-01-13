call plug#begin()

" general & dependencies
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'google/vim-glaive'
Plug 'google/vim-maktaba'
" tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/vim-tmux-clipboard'
" VCS
Plug 'tpope/vim-fugitive'
" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Zenburn'
" auto complete / format
Plug 'Valloric/YouCompleteMe'
Plug 'google/vim-codefmt'
" search
Plug 'junegunn/fzf', {'on': 'FZF'}
Plug 'mileszs/ack.vim', {'on': 'Ack'}
Plug 'preservim/nerdtree', {'on': 'NERDTreeFind'}
" language specific
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}

let g:airline_theme='zenburn'
let g:go_fmt_command = "goimports"
let g:fish_indent_command = "fish_indent"
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

call plug#end()

augroup autoformat_settings
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType typescript AutoFormatBuffer clang-format
augroup END

au Filetype go setlocal ts=2 sw=2 noet

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set colorcolumn=81
set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
set history=10000
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set cmdheight=1
set switchbuf=useopen
set winwidth=81
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" enable highlighting for syntax
syntax on
" enable file type detection.
" also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100
" normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1
" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3
" insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" if a file is changed outside of vim, automatically reload it without asking
set autoread
set clipboard+=unnamedplus
" disable scratch window
set completeopt-=preview

set t_Co=256
colors zenburn

let mapleader=","
" move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" frequent file operations
nnoremap <leader>o <c-w>o
noremap <leader>e :FZF<CR>
noremap <leader>q :q!<CR>
noremap <leader>w :wq<CR>
" highlight / remove trailing spaces
match ErrorMsg '\s\+$'
noremap <Leader>rtw :%s/\s\+$//e<CR>
" Simple spell check
noremap <leader>l :setlocal spell spelllang=en_us<CR>

nnoremap <leader>n :NERDTreeFind<CR>

nnoremap <leader>f :FormatCode<CR>
vnoremap <leader>f :FormatLines<CR>
" TODO(jayzhuang): rustfmt is supported by codefmt, remove line below
" autocmd FileType rust nnoremap <leader>f :RustFmt<CR>

" ack.vim - ack (rg) stuff
noremap <leader>a :Ack! "
noremap <leader>c :Ack! "\b<cword>\b"<CR>
" fugitive - git stuff
" noremap <leader>gs :Gstatus<CR>
" noremap <leader>gr :Grebase 
" noremap <leader>gc :Gcommit 
noremap <leader>gd :Gvdiffsplit 
