set nocompatible "we're not using vi here
set hidden "let unsaved buffers live in the background 

"no one likes the error bells!
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

syntax on
filetype plugin indent on
set linebreak

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'dahu/vim-help'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'morhetz/gruvbox'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'sainnhe/everforest'

Plug 'preservim/vimux' "vim + tmux = :thumbs-up:
Plug 'benmills/vimux-golang' "I do a lot with go
call plug#end()

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"

let g:airline_powerline_fonts = 1

"this is necessary for vim to have colors inside of tmux ¯\_(ツ)_/¯
if (has("termguicolors"))
    set termguicolors
endif
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

"COLORS!
" For dark version.
set background=dark

" For light version.
" set background=light

" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'soft'

colorscheme everforest
