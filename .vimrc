set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ryanoasis/vim-devicons'
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
         
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256
set encoding=utf-8
set ttyfast
set background=dark

try
  colorscheme skeletor
catch
  colorscheme monokai
endtry 

set autoread

set backspace=indent,eol,start
let mapleader = " "

noremap <Space> <Nop>
nmap <leader>w :w!<cr>

"Disable arrow keys in Normal mode
no <Up> <Nop>
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>

"Disable arrow keys in Insert mode
ino <Up> <Nop>
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>



set mouse=nicr
set so=7
set path+=**
set wildmenu
set cmdheight=2
set foldcolumn=1
set number
set ruler
set relativenumber
set numberwidth=4
set autoindent
set cindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2	" Always show statusline

" Format the statusline
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ N\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ I\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ R\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ V\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("spell")
  set spell     
endif
nmap <f8>       :set nospell<cr>
imap <f8>  <c-o>:set nospell<cr>
nmap <f9>       :set spell spelllang=de_de<cr>
imap <f9>  <c-o>:set spell spelllang=de_de<cr>
nmap <f10>      :set spell spelllang=en_us<cr>
imap <f10> <c-o>:set spell spelllang=en_us<cr>
inoremap <f7> <c-g>u<Esc>[s1z=`]a<c-g>u   
nnoremap <f7> <c-g>u<Esc>[s1z=`]a<c-g>u 

" Vim`s file explorer netrw
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_liststyle=3
let g:netrw_localrmdir='rm -r'

"toggle netrw on the left side of the editor
nnoremap <leader>e :Lexplore<CR>



set noerrorbells
set visualbell
set t_vb=

set cursorline
"set lines=50 columns=90 linespace=0
set textwidth=80
set colorcolumn=+1
set nowrap

set tabstop=4
set softtabstop=4
set expandtab

set lazyredraw  "redraw only when we need to
set showmatch	"show matching parenthesis

set clipboard=unnamed
filetype plugin indent on
filetype indent on
set shiftwidth=2

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

au InsertLeave * hi Cursor guibg=red
au InsertEnter * hi Cursor guibg=orange

imap jj <ESC>
imap jk <ESC>
imap kj <ESC>

if &term =~ "xterm\\|rxvt\\|st"
	let &t_SI = "\<ESC>]12;orange\x7"
	let &t_EI = "\<ESC>]12;red\x7"
	silent !echo -ne "\033]12;red\007"
	autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

if &term =~ '^xterm\\|rxvt\\st'
  " solid underscore
  let &t_SI .= "\<Esc>[6 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

syntax on
