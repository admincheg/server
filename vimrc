i" Syntax file
"
" Maintainer: Pavlihin Ilya <vistilya@gmail.com>
" Date: 2014/03/31

syn on
set nocompatible
set backspace=indent,eol,start
set nobackup

set history=50
set ruler
set showcmd
set nu
set smarttab
set showmatch
set smartindent
set incsearch
set ignorecase
set smartcase
set softtabstop=2
set shiftwidth=2
set expandtab
set tabstop=2
set sw=2

set list
set listchars=precedes:<,extends:>
set autoread
set encoding=utf-8
set termencoding=utf-8

set fileencodings=utf-8,cp1251,cp866,koi8-r
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set laststatus=2
set hlsearch
set synmaxcol=2048

nmap <F2> :w<cr>
imap <F2> <esc>:w<cr>i
map <F7> :execute RotateFileFormat()<cr>
vmap <F7> <C-C><F7>
imap <F7> <C-O><F7>

let b:fformatindex=0
function! RotateFileFormat()
  let y = -1
  while y == -1
    let encstring = "#unix#dos#mac#"
    let x = match(encstring,"#",b:fformatindex)
    let y = match(encstring,"#",x+1)
    let b:fformatindex = x+1 
    if y == -1
      let b:fformatindex = 0 
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fileformat=".str
    endif
  endwhile
endfunction

map <F8> :execute RotateEnc()<cr>
vmap <F8> <C-C><F8>
imap <F8> <C-O><F8>

let b:encindex=0
function! RotateEnc()
  let y = -1
  while y == -1
    let encstring = "#utf-8#cp1251#cp866#koi8-r#8bit-cp#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1 
    if y == -1
      let b:encindex = 0 
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":e ++enc=".str
    endif
  endwhile
endfunction
