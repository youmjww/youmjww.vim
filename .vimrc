" version 1.1

" プラグインの管理のやつ
if &compatible
	set nocompatible
endif

set runtimepath+=~/youmjww.vim/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/youmjww.vim/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" 追加プラグイン
" ファイルエクスプローラ
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rking/ag.vim'

" react
" if filereadable(expand('~/youmjww.vim/configAndPlugin/.vimReactPlugin'))
" 	source ~/youmjww.vim/configAndPlugin/.vimReactPlugin
" endif

" php
if filereadable(expand('~/youmjww.vim/configAndPlugin/.vimPhpPlugin'))
	source ~/youmjww.vim/configAndPlugin/.vimPhpPlugin
endif

" スニペットツール
NeoBundle 'Shougo/neosnippet.vim'

" git
NeoBundle 'tpope/vim-fugitive'

" ファイル検索
NeoBundle "ctrlpvim/ctrlp.vim"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

NeoBundle "mechatroner/rainbow_csv"

" カラースキーム
" NeoBundle 'tomasiser/vim-code-dark'
NeoBundle 'tomasr/molokai'
call neobundle#end()

filetype plugin indent on

NeoBundleCheck


"--------------------------------------------------------------------------------------------------
"基本設定

" 行番号の表示
set number

" 行番号の相対表示
set relativenumber

"シンタックスハイライト
syntax on

" タイトルバーにファイル名を表示
set title

" 全角文字が変になるのを防ぐ
set ambiwidth=double

" タブ関係
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent

"tabを改行しても継続する
set autoindent
set smartindent

" 保存していないファイルがあっても別のファイルを開くことができる
set hidden

set history=50
" 矩形選択時に文字がなくても右にすすめるようにする
set virtualedit=block

" 左右のカーソル移動において、行を跨いで移動出来る様にする
set whichwrap=b,s,[,],<,>

" バックスペース有効化
set backspace=indent,eol,start

" よくわからんけど、見た目が変わるらしい
set wildmenu

" ヤンクしたらクリップボードに貼り付ける
set clipboard=unnamedplus,autoselect

"変換候補で表示される数を増やす
set pumheight=10

"現在の行をハイライト
set cursorline

" 検索結果をハイライトする
set hlsearch
autocmd ColorScheme * hi Search ctermbg=yellow

" F3でハイライトを解除する
noremap <F3> :noh<CR>

" swpファイルを生成しないようにする
set noswapfile

" ｘで文字を削除してもヤンクされないようにする
noremap PP "0p
noremap x "_x

" -------------------------------------------------------------------------------------------------
" とりあえず、インストールのタイミングなどでエラー落ちしないように silent! を適用しているやつ
" Statuslineの設定
silent! set laststatus=2
silent! set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ \[ENC=%{&fileencoding}]%P 

" 隠しファイルをデフォルトで表示させる
silent! let NERDTreeShowHidden = 1

" カラースキーム
silent! colorscheme codedark

" -------------------------------------------------------------------------------------------------
" ショートカット系

" スペースfでディレクトリツリーを開く
noremap <Space>f :NERDTree<CR>

" HLで右端左端へ移動
noremap <S-h>   ^
noremap <S-l>   $

" ファイルタイプによってインデントを変える
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
  autocmd FileType c    setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js   setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php  setlocal sw=4 sts=4 ts=4 et
  autocmd FileType go   setlocal sw=4 sts=4 ts=4 noet
endif

