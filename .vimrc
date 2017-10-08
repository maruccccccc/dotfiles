"
"    .vimrc"
"
"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
"     General Settings
"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

" 文字コードをUTF-8に変更"
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 左右のカーソル移動で行間移動可能にする
set whichwrap=b,s,<,>,[,]

"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
"     View Settings
"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示(縦)
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープを可視化
set visualbell
" カッコ入力時対応するカッコを表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動をできるようにする
nnoremap j gj
nnoremap k gk
" 文末のホワイトスペースをハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter,ColorScheme * match TrailingSpaces /\s\+$/
augroup END

"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
"     Editor Settings
"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

" 深下地を可視化
set list listchars=tab:\>\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅を2
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
"     Search Settings
"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

" 検索文字列が小文字の場合大文字小文字区別なく検索
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト削除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
autocmd BufWritePre * :%s/\s\+$//ge

"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
"     Plugin Settings
"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

" ========= install directory ==================
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" ========= dein settings ======================
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

call dein#begin(expand('$HOME/.vim/dein'))
call dein#add('Shougo/dein.vim')

" ========= plugins install ====================
call dein#add('itchyny/lightline.vim') " 情報を見やすく
call dein#add('kristijanhusak/vim-hybrid-material') " カラースキーム
call dein#add('Shougo/vimproc', {
    \  'build': {
    \    'windows' : 'tools\\update-dll-mingw',
    \    'cygwin'  : 'make -f make_cygwin.mak',
    \    'mac'     : 'make -f make_mac.mak',
    \    'linux'   : 'make',
    \    'unix'    : 'gmake',
    \  },
    \}) " vimshell用
call dein#add('Shougo/vimshell') "vim上でshellwを使うやつ
call dein#add('Townk/vim-autoclose') " カッコを自動で閉じる
call dein#add('tyru/vim-altercmd') " 小文字でエイリアスを貼る用
call dein#add('ConradIrwin/vim-bracketed-paste') " Cmd+v時自動的にペーストモードで貼る

call altercmd#load() " altercmdを有効化

call dein#end() " deinの設定終了
filetype plugin indent on " ファイルタイプの検出を有効化

if dein#check_install() " 未インストールのプラグインをインストール
  call dein#install()
endif

set background=dark
colorscheme hybrid_material
syntax on

"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
"     Add cmd
"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

AlterCommand rmspace BufWritePre
AlterCommand vis VimShellPop
