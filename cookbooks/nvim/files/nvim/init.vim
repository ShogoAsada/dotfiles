if &compatible
  set nocompatible
endif

if &runtimepath !~# '/dein.vim'
  let s:dein_repo_dir = expand('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim ' s:dein_repo_dir
  endif

  execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  let s:toml = '~/.config/nvim/.dein.toml'
  let s:lazy_toml = '~/.config/nvim/.dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()

  if dein#check_install()
    call dein#install()
  endif
endif

filetype plugin indent on

set sh=fish
set clipboard=unnamed

set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set completeopt=menuone,noinsert
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

set number
set cursorline
" set cursorcolumn
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
syntax enable

set list listchars=tab:\▸\-
set expandtab
set tabstop=2
set shiftwidth=2

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

tnoremap <silent> <ESC> <C-\><C-n>

" ctrl s でファイル保存
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" neovim を閉じても undo できる
" 事前にディレクトリを作っておく
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" NERDTree
" Ctrl-nでNERDTreeを開く
map <C-n> :NERDTreeToggle<CR>
" 隠しファイルを表示する
let NERDTreeShowHidden = 1

" accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-table-mode
let g:table_mode_corner = '|'

" vim-test
let g:test#strategy = 'neovim'

nnoremap <leader>n :TestNearest<CR>
nnoremap <Leader>f :TestFile<CR>
nnoremap <Leader>l  :TestLast<CR>

" fzf.vim
nnoremap <silent>rg  :Rg<CR>

" vim-sqlfmt
nnoremap <buffer><leader>q :SQLFmt<CR>

" surround.vim
let g:surround_{char2nr("=")} = "<%= \r %>"

