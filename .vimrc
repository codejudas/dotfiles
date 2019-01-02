syntax on                                   " syntax highlighting
colorscheme tropikos                        " theme
set number                                  " line numbers
highlight Normal guibg=black guifg=white
set background=dark
set expandtab                               " expand tab to spaces
set autoindent
set tabstop=4                               " tab width
set shiftwidth=4
set cursorline                              " highlight current line 
set showmatch                               
set incsearch
set hlsearch                                " highlight search matches
set title                                   " show file title in terminal tab
set wildmenu
set lazyredraw

" Add characters to be considered word boundaries
set iskeyword-=_

set updatetime=1000                         " update time for git gutter plugin.

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.class,*.pdf

" Auto commands to run when editing specific types of files.
augroup configgroup
	autocmd!
	autocmd VimEnter * highlight clear SignColumn
	autocmd BufEnter *.cls setlocal filetype=java
	autocmd BufEnter *.zsh-theme setlocal filetype=zsh
	autocmd BufEnter Makefile setlocal noexpandtab
	autocmd BufEnter *.sh setlocal tabstop=2
	autocmd BufEnter *.sh setlocal shiftwidth=2
	autocmd BufEnter *.sh setlocal softtabstop=2
	autocmd BufEnter *.py setlocal tabstop=4
	autocmd BufEnter *.md setlocal ft=markdown
augroup END

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'isRuslan/vim-es6'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'leafgarland/typescript-vim'
call plug#end()

" Remap ; to :
noremap ;; ;
map ; :

" ,y to copy to system clipboard
vnoremap ,y "+y

" ,p to paste from system clipboard
vnoremap ,p "+p

" show airline
set laststatus=2

" Fix backspace not working sometimes
set backspace=indent,eol,start

" Disable \" concealment in json files
let g:vim_json_syntax_conceal = 0

" Override default conceal level only for indentLine
let g:conceallevel=0
let g:indentLine_setConceal = 0

" Ignore some files
set wildignore+=*.so,*.swp,*.zip,*/node_modules/*

" CTRL P File Filtering""
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
