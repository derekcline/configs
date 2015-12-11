
" Pathogen
call pathogen#infect()
call pathogen#helptags()

set nocompatible    " disable backward compatibility with Vi
set background=dark " Assume a dark background
set laststatus=2    " always show status line
set encoding=utf-8  " Necessary to show Unicode glyphs (powerline)
"set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
"set statusline=%<\ » %f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
"hi statusline guibg=red
"hi StatusLine ctermbg=white ctermfg=white

" statusline from
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

"set statusline=%<\ »\ %F%h%m%r%w%=%{fugitive#statusline()}\ [%{strlen(&fenc)?&fenc:&enc}]\ [%c,%l/%L]
set statusline=%<\ %F%h%m%r%w%=[%{strlen(&fenc)?&fenc:&enc}]\ [%c,%l/%L]


filetype plugin indent on " Automatically detect file types

syntax on
set number         " line numbers
set ruler          " column/line/% status info
set hlsearch       " highlight matching string
set smartcase      " unless a capital is typed
set autoindent     " indent at the same level of the previous line
set ignorecase     " ignore case
"set incsearch      " lets you highlight your search before a substitution, searches on the fly, kind of annoying

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

"set cursorline
"if has("unnamedplus")
"    set clipboard=unnamedplus
"elseif has("clipboard")
"    set clipboard=unnamed
"endif

" clear highlighting with space
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"noremap <F2> :Gstatus <CR>
"noremap <F3> :Gdiff <CR>
"noremap <F4> :Gblame <CR>
"noremap <F5> :set number!<CR><ESC>
"noremap <F6> :set list!<CR>
"noremap <F7> :Tidy<CR>
"noremap <F8> :TlistToggle <CR><ESC>
"noremap <F9> :Vexplore<CR>
"set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

map <leader>gb :Gblame<CR>
map <leader>gd :Gdiff<CR>
map <leader>gs :Gstatus<CR>
map <leader>gl :Glog<CR>

" Colors
syntax enable
colorscheme default
set t_Co=256                        " force vim to use 256 colors
"let g:solarized_termcolors=256      " use solarized 256 fallback

" Powerline
"let g:Powerline_theme = 'default'
"let g:Powerline_colorscheme = 'default'
"let g:Powerline_symbols = 'fancy'

" SVNCommand settings
"let SVNCommandEnableBufferSetup=1
"let SVNCommandEdit='split'
"let SVNCommandNameResultBuffers=1

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
if exists("g:did_load_filetypes")
    filetype off
    filetype plugin indent off
endif
set runtimepath+=$GOROOT/misc/vim " replace $GOROOT with the output of: go env GOROOT
filetype plugin indent on
syntax on

autocmd FileType go autocmd BufWritePre <buffer> Fmt

" perl unit test syntax highlighting on *.t files
autocmd BufRead *.t set syntax=perl

" Make tabs, trailing whitespace, and non-breaking spaces visible
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" set color of column 120
"execute "set colorcolumn=" . join(range(120,335), ',')
set colorcolumn=120
highlight ColorColumn ctermbg=235 guibg=#2c2d27

"highlight Search cterm=NONE ctermfg=235 ctermbg=blue
highlight DiffChange cterm=NONE ctermfg=1 ctermbg=blue

" turn off colorscheme during vimdiff
"au FilterWritePre * if &diff | set t_Co=0 | endif

map <leader>ff :FufCoverageFile<CR>

command SyncSave w | MirrorPush
map <leader>ss :SyncSave<CR>

" Nerdtree
"autocmd vimenter * NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
"let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
map ctrl-n to toggle vim
map <C-n> :NERDTreeToggle<CR>

" Nerdtree tabs
"map <c-l> :tabn<cr>
"map <c-h> :tabp<cr>
"map <c-n> :tabnew<cr>

"map <C-n> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
"map <leader>e :NERDTreeFind<CR>
"nmap <leader>nt :NERDTreeFind<CR>

"autocmd VimEnter * wincmd l
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"auto focus file when opening vim
"auto quit vim if NERDTree is last and only buffer
"autocmd BufNew * wincmd l

" Exuberant ctags {
"map <C-t> <esc>:TlistToggle<cr>
map <C-t> <esc>:TagbarToggle<cr>
"nnoremap <silent> <leader>tt :TagbarToggle<CR>

" This will look in the current directory for 'tags', and work up the tree towards root until one is found. 
"set tags=./tags;/,$HOME/vimtags
set tags=./.git/tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> " C-\ - Open the definition in a new tab
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>      " A-] - Open the definition in a vertical split
" }


set hidden " When a buffer is brought to foreground, remember undo history and marks

