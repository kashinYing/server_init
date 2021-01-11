set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'Lokaltog/vim-powerline'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'valloric/youcompleteme'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
call vundle#end()            " required
filetype plugin indent on    " required

set backspace=indent,eol,start

" theme
syntax enable
colorscheme gruvbox
set bg=dark

" power line
" let g:Powerline_symbols='fancy'
set encoding=utf-8
set laststatus=2

" display
set nu
set nowrap

" indent
syntax on
set noswapfile       " no swap file
set ai               " auto indent
set si               " smart indent
set ci               "
set sw=2             " shift width
set ts=2             " tabstop size
set expandtab

" disable up down keys
nmap <Up> <NOP>
nmap <Down> <NOP>
nmap <Left> <NOP>
nmap <Right> <NOP>

" ctrlp
" see http://kien.github.io/ctrlp.vim/#installation
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

let g:ctrlp_dotfiles=1

let g:ctrlp_custom_ignore={
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

" ycm
let g:ycm_key_list_stop_completion=[ '<C-y>', '<Enter>' ]

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='<space>'

" nerdtree-tabs
" Drop NERDTree Tabs settings at the end of the config file
" Open file via NERDTree Tabs, hot key: \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" Start NERDTree Tabs automatically
let g:nerdtree_tabs_open_on_console_startup=1

" nerdcommenter
let g:NERDSpaceDelims=1               " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs=1           " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign='left'         " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines=1         " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace=1    " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines=1       " Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDTreeShowHidden=1            " Show dotfiles
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

" tab swtich
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
