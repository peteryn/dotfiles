" vimplug install plugins
call plug#begin('~/.vim/plugged')
Plug 'catppuccin/vim', {'as': 'catppuccin'}
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

" syntax highlighting
syntax on
colorscheme catppuccin_mocha
set termguicolors

" set text width (80 char on a line before \n)
" set tab length
" tabs will not behave like spaces
" shift width when blocks are moved for indentation
set tw=80 ts=4 sts=0 sw=4
" filetype settings
au BufRead,BufNewFile *.c setlocal textwidth=80
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal expandtab tw=80 sts=4 sw=4
autocmd FileType haskell setlocal shiftwidth=4 smarttab expandtab tabstop=8 softtabstop=0

" line numbers
set number
"set relativenumber
"set colorcolumn=80

" highlighting with cursor doesn't get line numbers
set mouse+=a

" highlights current line
set cursorline

" hit enter to enter command mode (:)
nnoremap <CR> :

" Map space and \ as leader keys
let mapleader="\<Space>"
let maplocalleader="\\"

" Use <space><space> to toggle to the last buffer 
" open multiple files and switch between them
" also use :n
nnoremap <leader><leader> <c-^>

" lightline config
" lightline and uses vim-fugitive for git status
set laststatus=2
let g:lightline = {
			\ 'colorscheme': 'catppuccin_mocha',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightLineFilename'
      \ },
      \ }
function! LightLineFilename()
  return expand('%:p')
endfunction

" turn off vim bell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set visualbell
set t_vb=

" terminal stuff
if &term == "alacritty"        
  let &term = "xterm-256color"
endif
hi Normal guibg=NONE ctermbg=NONE

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" copy into buffer, then use ctrl-shift-2 to copy into system
nnoremap <C-@> :call system("wl-copy", @")<CR>
