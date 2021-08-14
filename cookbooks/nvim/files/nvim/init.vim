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

" NERDTree
" Ctrl-nでNERDTreeを開く
map <C-n> :NERDTreeToggle<CR>
" 隠しファイルを表示する
let NERDTreeShowHidden = 1

" accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" deoplete & LSP Client
set completeopt+=noinsert
let g:python_host_prog = expand('/usr/local/bin/python2')
let g:python3_host_prog = expand('/usr/local/bin/python3')

" run-rspec.vim
nnoremap <leader>r :RunSpec<CR>
nnoremap <leader>l :RunSpecLine<CR>
nnoremap <leader>e :RunSpecLastRun<CR>
nnoremap <leader>cr :RunSpecCloseResult<CR>
let g:run_rspec_bin = 'bundle exec rspec'

