set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'wakatime/vim-wakatime'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syn on
set number
set mouse=a
set tabstop=4
set backupdir=~/.vim
set ts=4
set colorcolumn=81
:%retab!
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

command! W w
command! Q q
command! WQ wq
command! Wq wq
command! WA wa
command! Wa wa
command! WQA wqa
command! WQa wqa
command! Wqa wqa
command! WqA wqa
command! XA xa
command! Xa xa
set backspace=indent,eol,start
