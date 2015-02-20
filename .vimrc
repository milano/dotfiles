" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible

" Enable syntax highlighting
syntax on

"------------------------------------------------------------
" Must have options

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" コマンドライン補完を便利に
set wildmenu wildmode=list:longest,full

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch

" インクリメンタルサーチ
set incsearch

" コマンドラインの履歴を増やす
set history=1000

"Unicodeで行末が変になる問題を解決
set ambiwidth=double

"------------------------------------------------------------
" Usability options

" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" 画面最下行にルーラーを表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" そしてビジュアルベルも無効化する
set t_vb=

" 全モードでマウスを有効化
set mouse=a

" コマンドラインの高さを2行に
set cmdheight=2

" 行番号を表示
set number

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" <F4>キーで'paste'と'nopaste'を切り替える
set pastetoggle=<F4>

" 他で書き換えられたら自動で読み直す
set autoread

" スワップファイル作らない
set noswapfile

" カーソルを行頭、行末で止まらないようにする
"set whichwrap=b,s,h,l,<,>,[,]

" newrwをツリービューで起動
let g:netrw_liststyle = 3

set grepprg=grep\ -nH

"------------------------------------------------------------
" Indentation options

set shiftwidth=4
set softtabstop=4
set tabstop=4

" オートインデント
set autoindent
set smartindent

" インデントにハードタブを使う場合の設定。
" タブ文字を2文字分の幅で表示する。
"set shiftwidth=2
"set tabstop=2

"------------------------------------------------------------
" Mappings

" Yの動作をDやCと同じにする
map Y y$

" コマンドラインモードで %% を入力すると現在編集中の
" ファイルのフォルダのパスが展開されるようにする
cnoremap %% <C-R>=expand('%:p:h').'/'<cr>

" F2, F3 でバッファの切替
map <F2> <esc>:bp<cr>
map <F3> <esc>:bn<cr>

" Ctrl+Gでいろいろキャンセル
noremap  <C-g> <esc>
inoremap <C-g> <esc>
cnoremap <C-g> <esc>

"noremap <C-l> :BufExplorer<CR>j
noremap <C-l> :Unite buffer<CR>

" 検索結果を画面中央にする
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz  

"------------------------------------------------------------
" Plugins

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'fatih/vim-go'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'

" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
filetype plugin indent on

NeoBundleCheck

"------------------------------------------------------------
" Color

" 256色モードにする
set t_Co=256

" カーソルに下線を引く
set cursorline

" カラースキーマ設定
colorscheme koehler

"------------------------------------------------------------
" airline

let g:airline#extensions#tabline#enabled = 1
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0

"------------------------------------------------------------
" neocomplcache
" http://www.karakaram.com/neocomplcache
" http://qiita.com/hide/items/229ff9460e75426a2d07

"補完ウィンドウの設定
set completeopt=menuone

"起動時に有効
let g:neocomplcache_enable_at_startup = 1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplcache_max_list = 20
"自動補完を行う入力数を設定。初期値は2
let g:neocomplcache_auto_completion_start_length = 2
"手動補完時に補完を行う入力数を制御。値を小さくすると文字の削除時に重くなる
let g:neocomplcache_manual_completion_start_length = 3
"バッファや辞書ファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_keyword_length = 4
"シンタックスファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_syntax_length = 3
"1:補完候補検索時に大文字・小文字を無視する
let g:neocomplcache_enable_ignore_case = 1
"入力に大文字が入力されている場合、大文字小文字の区別をする
let g:neocomplcache_enable_smart_case = 1
"大文字小文字を区切りとしたあいまい検索を行うかどうか。
"DTと入力するとD*T*と解釈され、DateTime等にマッチする。
let g:neocomplcache_enable_camel_case_completion = 1
"アンダーバーを区切りとしたあいまい検索を行うかどうか。
"m_sと入力するとm*_sと解釈され、mb_substr等にマッチする。
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" http://vim-users.jp/2010/10/hack177/

autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dictionary/php.dict filetype=php
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'

"highlight Pmenu ctermbg=196
"highlight PmenuSel ctermbg=1
"highlight PMenuSbar ctermbg=4

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
	"   "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

"tabで補完候補の選択を行う
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>"  : "\<S-TAB>"
"C-h, BSで補完ウィンドウを確実に閉じる
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
"C-yで補完候補の確定
inoremap <expr><C-y> neocomplcache#close_popup()
"C-eで補完のキャンセルし、ウィンドウを閉じる。ポップアップが開いていないときはEndキー
inoremap <expr><C-e> pumvisible() ? neocomplcache#cancel_popup() : "\<End>"
"改行で補完ウィンドウを閉じる
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"vim標準のキーワード補完を置き換える
"inoremap <expr><C-n> neocomplcache#manual_keyword_complete()
"C-pで上キー
inoremap <C-p> <Up>
"補完候補の共通文字列を補完する(シェル補完のような動作)
inoremap <expr><C-l> neocomplcache#complete_common_string()

"------------------------------------------------------------
" syntastic
" http://c-brains.jp/blog/wsg/13/02/27-102230.php

let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
let g:syntastic_php_phpcs_args = '--report=csv --standard=/Users/tsukui/.vim/phpcs-rule.xml'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"------------------------------------------------------------
" autocmd

" アクティブウィンドウに限りカーソル行(列)を強調する
augroup vimrc_set_cursorline_only_active_window
  autocmd!
  autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" インサートモードに入った時にカーソル行の色を変更する
augroup vimrc_change_cursorline_color
  autocmd!
  " インサートモードに入った時にカーソル行の色をブルーグリーンにする
  autocmd InsertEnter * highlight CursorLine ctermbg=24 guibg=#005f87 | highlight CursorColumn ctermbg=24 guibg=#005f87
  " インサートモードを抜けた時にカーソル行の色を黒に近いダークグレーにする
  autocmd InsertLeave * highlight CursorLine ctermbg=236 guibg=#303030 | highlight CursorColumn ctermbg=236 guibg=#303030
augroup END

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
autocmd BufNewFile,BufRead * match ZenkakuSpace /　/

" grepは自動的にquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

"-----------------------------------------------------------
" Unite

let g:unite_enable_start_insert = 0
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,uo :<C-u>Unite outline<CR>

" grep検索
nnoremap <silent> ,ug  :<C-u>Unite grep:. -buffer-name=search-buffer -auto-preview<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,ucg :<C-u>Unite grep:. -buffer-name=search-buffer -auto-preview<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,ur  :<C-u>UniteResume search-buffer<CR>

"-----------------------------------------------------------
" fugitive

noremap <silent> ,gs :<C-u>Gstatus<CR>
noremap <silent> ,ga :<C-u>Gwrite<CR>
noremap <silent> ,gr :<C-u>Gread<CR>
noremap <silent> ,gc :<C-u>Gcommit<CR>
noremap <silent> ,gb :<C-u>Gblame<CR>
noremap <silent> ,gd :<C-u>Gdiff<CR>
noremap <silent> ,gp :<C-u>Gpull<CR>
noremap <silent> ,gl :<C-u>Glog<CR>

"-----------------------------------------------------------
" golang

let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0

