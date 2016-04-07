
" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'zenbro/mirror.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-cucumber'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-scripts/FuzzyFinder'
"Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/L9'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/taglist.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/AutoTag'
Plugin 'Shougo/neocomplete.vim'
Plugin 'joonty/vdebug'

call vundle#end()            " required
filetype plugin indent on    " Automatically detect file types

let g:neocomplete#enable_at_startup = 1
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

function! s:close_popup_and_complete()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>close_popup_and_complete()<CR>

" [ .vim/ftplugin/perl/keyword_for_perl file] 
" Append : to the list of keyword chars to allow completion on Module::Names 
set iskeyword+=:

" vim basics
set background=dark " Assume a dark background
set laststatus=2    " always show status line
set encoding=utf-8  " Necessary to show Unicode glyphs (powerline)

" basic statusline
"set statusline=%<\ %F%h%m%r%w%=[%{strlen(&fenc)?&fenc:&enc}]\ [%c,%l/%L]


syntax on
set number         " line numbers
set ruler          " column/line/% status info
set hlsearch       " highlight matching string
set smartcase      " unless a capital is typed
set autoindent     " indent at the same level of the previous line
set ignorecase     " ignore case
"set incsearch      " lets you highlight your search before a substitution, searches on the fly

set history=1000
set viminfo+=%     " restore buffer list if zvim is launched without a file arg
set viminfo+=r/tmp " don't save info for temp files

" the following settings are controversial!
set expandtab       " tabs are spaces, not tabs
set tabstop=4       " an indentation every four columns
set softtabstop=4   " let backspace delete indent
set shiftwidth=4    " use indents of 4 spaces

" Fix issues with delete key not working 2014-11-24
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

" clear highlighting with space
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Quickly open/reload vim
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" fugitive shortcuts
map <leader>gb :Gblame<CR>
map <leader>gd :Gdiff<CR>
map <leader>gs :Gstatus<CR>
map <leader>gl :Glog<CR>

" Colors
syntax enable
colorscheme default
set t_Co=256                        " force vim to use 256 colors

" perl unit test syntax highlighting on *.t files
autocmd BufRead *.t set syntax=perl

" Make tabs, trailing whitespace, and non-breaking spaces visible
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" set color of column 120
"execute "set colorcolumn=" . join(range(120,335), ',')
"set colorcolumn=120
"highlight ColorColumn ctermbg=235 guibg=#2c2d27

"highlight Search cterm=NONE ctermfg=235 ctermbg=blue
highlight DiffChange cterm=NONE ctermfg=1 ctermbg=blue

" turn off colorscheme during vimdiff
"au FilterWritePre * if &diff | set t_Co=0 | endif

" FuzzyFinder shortcuts
map <leader>ff :FufCoverageFile<CR>

" mirror.vim shortcuts
command! SyncSave w | MirrorPush
map <leader>ss :SyncSave<CR>

" Nerdtree
"autocmd vimenter * NERDTree
let NERDTreeWinSize=35
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
" map to toggle NERDTree window
noremap <F1> :NERDTreeToggle <CR>
noremap <F2> :NERDTreeFind <CR>

" NERDTree tabs
map <c-l> :tabn<cr>
map <c-h> :tabp<cr>
map <c-n> :tabnew<cr>

" Exuberant ctags {
noremap <F3> :TagbarToggle <CR>

" This will look in the current directory for 'tags', and work up the tree towards root until one is found. 
set tags=./.git/tags,./tags,~/Sandbox/tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> " C-\ - Open the definition in a new tab
" }

set hidden " When a buffer is brought to foreground, remember undo history and marks

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 18
let g:airline#extensions#whitespace#show_message = 0
let g:airline#extensions#whitespace#checks = []

" window splitting
set splitbelow
set splitright

" set K to perldoc -f while on that keyword
set keywordprg=perldoc\ -f



