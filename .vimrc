let $MYVIMDIR=expand('~/.vim')
let $VIMLOCAL=expand($MYVIMDIR . '/local')

" denite
let g:python3_host_plugeh=expand('~/.anyenv/envs/pyenv/shims/python3')

language C
set helplang=en,ja

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" For multi byte
set ambiwidth=double

" For indent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable file backups
set nobackup
set nowritebackup
set noswapfile

" ファイルを閉じた後でもundoできるようにする
if !isdirectory($VIMLOCAL . '/undo')
  call mkdir($VIMLOCAL . '/undo')
endif
set undofile
set undodir=$VIMLOCAL/undo

set matchpairs& matchpairs+=<:>

set number
set hidden
set ruler
set showcmd
set showmode
set autoread
set nostartofline
set title
set wildmenu
" 非表示文字を表示できるようにする

set list
set listchars=tab:>\ "

set backspace=indent,eol,start
set linespace=1
set mouse=a
set clipboard=unnamed
set keywordprg=:help
set scrolloff=3
set textwidth=0
set history=50
set laststatus=2
set cmdheight=2
set completeopt=longest,menuone
" 行末にカーソルが行った時に自動改行
set whichwrap=b,s,<,>,[,],~

set statusline=%f%m%r%h%w\ -\ [%{(&fenc!=''?&fenc:&enc)}\ %{&ff}\ %Y]\ [%Llines\]\ (%04l,%04v)\ %{ALEGetStatusLine()}
" コメントの継続
set formatoptions=croql
set fileignorecase
" escキーの反応をよくする
set timeoutlen=1200
set ttimeoutlen=10
" デフォルトでグローバル置換
set gdefault

" keybinding
inoremap <C-a> <Esc><S-i>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>


" altの設定
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' } " ファイル検索
Plug 'Shougo/neomru.vim' " ディレクトリ検索?
Plug 'tpope/vim-surround' " タグでかこめる
Plug 'othree/yajs.vim'
Plug 'https://github.com/w0rp/ale.git' " リント
Plug 'mattn/emmet-vim' " html
Plug 'pangloss/vim-javascript' " js ハイライト
Plug 'mxw/vim-jsx' " jsx ハイライト

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"denite vimの設定
nmap <Space> [denite]
nnoremap <silent> [denite]<CR> :<C-u>Denite file_rec<CR>
nnoremap <silent> [denite]g :<C-u>Denite -auto_preview grep<CR>
nnoremap <silent> [denite]gw :<C-u>DeniteCursorWord -auto_preview grep<CR>
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
nnoremap <silent> [denite]f :<C-u>Denite buffer file_mru<CR>
nnoremap <silent> [denite]d :<C-u>Denite directory_mru<CR>
nnoremap <silent> [denite]h :<C-u>Denite command_history<CR>
nnoremap <silent> [denite]r :<C-u>Denite register<CR>

call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

