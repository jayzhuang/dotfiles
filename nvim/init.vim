call plug#begin()

Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Valloric/YouCompleteMe'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'google/vim-maktaba'
Plug 'junegunn/fzf'
Plug 'mileszs/ack.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Zenburn'
Plug 'vim-syntastic/syntastic'

let g:airline_theme='zenburn'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map={'mode': 'passive'}

let g:go_fmt_command = "goimports"
let g:fish_indent_command = "fish_indent"
let g:syntastic_go_checkers = ['goimports']

call plug#end()

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
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
set relativenumber
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
" highlight CursorLine term=NONE cterm=NONE ctermbg=darkblue
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
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100
" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1
" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3
" Turn folding off
" set foldmethod=manual
" set nofoldenable
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it without asking
set autoread
" It's time for "+y to go away
set clipboard+=unnamedplus
" Disable scratch window
set completeopt-=preview

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ZENBURN!!!BURN!!!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
colors zenburn

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

let mapleader=","
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
map <leader>e :FZF<CR>
map <leader>q :q!<CR>
map <leader>w :wq<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HANDLE TRAILING WHITESPACES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPELL CHECK
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>l :setlocal spell spelllang=en_us<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CODE FORMATTING (RELIES ON codefmt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>f :FormatCode<CR>
vmap <leader>f :FormatLines<CR>
autocmd FileType rust nmap <leader>f :RustFmt<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTASTIC CHECK (RELIES ON syntastic)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Conflict with old horizontal split, which is commented to use FZF instead
map <leader>s :SyntasticCheck<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMUX COMMANDS (RELIES ON vimux)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>vp :VimuxPromptCommand<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ACK
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>a :Ack! 
map <leader>c :Ack! "\b<cword>\b"<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""	
" Gstatus (RELIES ON fugitive)	
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""	
map <leader>gs :Gstatus<CR>	
map <leader>gc :Gcommit<CR>	
map <leader>gd :Gdiff<CR>
