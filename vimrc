if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" run :Pluginstall from vim command line
" https://github.com/junegunn/vim-plug
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
" Eslint checking
Plug 'w0rp/ale'
Plug 'reasonml-editor/vim-reason-plus'
"initialize plugin system
call plug#end()
set t_Co=256

" use jsx syntax detection in non .jsx files (may be .js, for example)
let g:jsx_ext_required = 0

"automatically refresh any open files that haven't been edited.
set autoread

"match hilight trailing whitespace and lines chars over 80
"match ErrorMsg /\s\+$\|\%>80v.\+/
set textwidth=80
autocmd BufWinEnter *.js,*.jsx,*.svelte match ErrorMsg /\s\+$\|\%>80v.\+/
autocmd InsertEnter *.js,*.jsx,*.svelte match ErrorMsg /\s\+\%#\@<!$\|\%>80v.\+/
autocmd InsertLeave *.js,*.jsx,*.svelte match ErrorMsg /\s\+$\|\%>80v.\+/
autocmd BufWinLeave *.js,*.jsx,*.svelte call clearmatches()

" delete trailing whiteshace in js&json files on save
autocmd FileType js,json,svelte,jsx autocmd BufWritePre <buffer> %s/\s\+$//e

autocmd BufNewFile,BufRead,BufReadPost *.svelte set filetype=html

set expandtab "use spaces instead of tabs
set tabstop=4 "number of spaces it uses for existing tabs
set softtabstop=4 "number of spaces when you hit tab
set shiftwidth=4 "number of chars used for indention

set number "show line numbers
set showcmd "show command in bottom bar
set cursorline "highlite line
set cursorcolumn
set wildmenu "visual autocomplete for command menu
set showmatch "hilites opposing parens, etc
set incsearch "search as chars are entered
set hlsearch "hilites matches during search

"the default leader key is \

set foldmethod=indent
set foldlevel=10

" For git commit messages to start the edit session at line 0:
autocmd BufReadPost .git/COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
" Spell check your commit messages:
autocmd FileType gitcommit setlocal spell
autocmd FileType .md setlocal spell

" always equalize the size of split windows
set equalalways

" new windows below and right
set splitbelow
set splitright

set spelllang=en_us          "spell checker lang/ use ":setlocal spell" to turn it on

colorscheme gruvbox
set background=dark " dark/light gruvbox variant
"this is needed to make the background color match the colorscheme
"in tmux in the galliumos terminal
set t_ut=

" SAVED MACROS
" , l to log shit
nnoremap <leader>l ccconsole.log(JSON.stringify({}, null, 2));hhhhhhhhhhhh
" , d to get a mocha describe
nnoremap <leader>d ccdescribe('', () => {});kllllllll
" , i to get a mocha it
nnoremap <leader>i ccit('', () => {});kll
" , a to get an assert.deepstrictEqual
nnoremap <leader>a ccassert.deepStrictEqual(result, expected);
" , t to insert the standard test modules
nnoremap <leader>t iconst {it, describe} = require('mocha');const assert = require('assert');


" consider - part of word for autocomplete
set iskeyword+=\-

" ale config
let g:ale_linter_aliases = {
\   'svelte': ['javascript']
\}
let g:ale_linters = {
\   'svelte': ['eslint']
\}
let g:ale_fixers = {
\   'svelte': ['eslint']
\}
" jump to next/previous error
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

set spell spelllang=en_us
