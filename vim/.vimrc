" References:
" https://github.com/pbzweihander/.dotfiles/blob/master/home/.vimrc

" Indentation
set cindent
set autoindent
set smartindent

" Tab
set softtabstop=4
set shiftwidth=4
set expandtab

" Searching
set ignorecase
set smartcase
set hlsearch
"set nowrapscan
set incsearch

" etc
set number
set ruler
set history=1000
set scrolloff=3

" syntax highlighting
syntax on

" jump to last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" vim plugins (vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
call plug#end()

