"
"    .vimrc"
"
"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
"    General Settings
"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

" 文字コードをUTF-8に変更"
set fenc=utf-8
" バックアップファイルを作らない
set nobackup

set noswapfile

set autoread

set hidden

set showcmd

set whichwrap=b,s,<,>,[,]


set number
set cursorline
set cursorcolumn
set virtualedit=onemore
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter,ColorScheme * match TrailingSpaces /\s\+$/
augroup END

set expandtab
set tabstop=2
set shiftwidth=2

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
autocmd BufWritePre * :%s/\s\+$//ge

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

call dein#begin(expand('$HOME/.vim/dein'))
call dein#add('Shougo/dein.vim')

call dein#add('itchyny/lightline.vim')
call dein#add('kristijanhusak/vim-hybrid-material')
call dein#add('Shougo/vimproc', {
  \  'build': {
  \    'windows' : 'tools\\update-dll-mingw',
  \    'cygwin'  : 'make -f make_cygwin.mak',
  \    'mac'     : 'make -f make_mac.mak',
  \    'linux'   : 'make',
  \    'unix'    : 'gmake',
  \  },
  \})

call dein#add('Shougo/vimshell')
call dein#add('Townk/vim-autoclose')
call dein#add('tyru/vim-altercmd')
call dein#add('ConradIrwin/vim-bracketed-paste')

call altercmd#load()

call dein#end()
filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

set background=dark
colorscheme hybrid_material
syntax on

AlterCommand rmspace BufWritePre
AlterCommand vis VimShellPop
