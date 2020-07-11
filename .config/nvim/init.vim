set whichwrap=b,s,h,l				"行末行頭の左右移動で行をまたぐ
set scrolloff=4

set number							"行番号
set cursorline						"下線
set termguicolors					"カラー
set list							"不可視文字(tab文字等)の表示
set listchars=tab:>-,trail:_		"同上の表示指定

set showmatch						"対応する括弧のハイライト
set autoindent						"前の行のインデントの継続
set smartindent						"改行時に次のインデントの自動調整
set expandtab						"タブ文字を空白表示
set tabstop=4						"タブ文字の幅
set shiftwidth=4					"オートインデントでずれる幅
set softtabstop=4					"連続空白に対するTabやBsによる移動幅

set splitbelow						"splitで下に開く
set splitright						"vsplitで右に開く

set clipboard=unnamedplus
set encoding=utf-8

set background=dark

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	" プラグインリストを収めた TOML ファイル
	let g:rc_dir	= expand("~/.config/nvim")
	let s:toml		= g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

	" TOML を読み込み、キャッシュしておく
	call dein#load_toml(s:toml,		 {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})

	" 設定終了
	call dein#end()
	call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
	call dein#install()
endif

let g:python3_host_prog = expand('~/.pyenv/shims/python')

augroup fileTypeIndent
	autocmd!
	autocmd BufNewFile,BufRead *.js   setlocal softtabstop=2 shiftwidth=2
	autocmd BufNewFile,BufRead *.jsx  setlocal softtabstop=2 shiftwidth=2
	autocmd BufNewFile,BufRead *.ts   setlocal softtabstop=2 shiftwidth=2
	autocmd BufNewFile,BufRead *.txs  setlocal softtabstop=2 shiftwidth=2
	autocmd BufNewFile,BufRead *.vue  setlocal softtabstop=2 shiftwidth=2
	autocmd BufNewFile,BufRead *.html setlocal softtabstop=2 shiftwidth=2
	autocmd BufNewFile,BufRead *.json setlocal softtabstop=2 shiftwidth=2
	autocmd BufNewFile,BufRead *.jl   setlocal softtabstop=4 shiftwidth=4
	autocmd BufNewFile,BufRead *.py   setlocal softtabstop=4 shiftwidth=4
	autocmd BufNewFile,BufRead *.go   setlocal noexpandtab
augroup END

filetype plugin indent on
syntax enable
