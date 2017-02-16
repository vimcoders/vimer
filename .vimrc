" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" You can also specify a different font, overriding the default font
"if has('gui_gtk2')
"  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"else
"  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
"endif

" If you want to run gvim with a dark background, try using a different
" colorscheme or running 'gvim -reverse'.
" http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/ has examples and
" downloads for the colorschemes on vim.org

" Source a global configuration file if available
if filereadable("/etc/vim/gvimrc.local")
  source /etc/vim/gvimrc.local
endif

"******************************************************************************
"" "                          << vundle >>
"******************************************************************************

" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"******************************************************************************
"" "                              << ycm >>
"******************************************************************************

"******************************************************************************
"" "                              << view >>
"******************************************************************************
set nocompatible "close vi
set number "line number
set ruler "status bar ruler
set shiftwidth=4
set softtabstop=4
set nobackup
set smartindent "new line auto tab
set backspace=indent,eol,start
set encoding=utf-8
set termencoding=utf-8
set fencs=utf-8,gbk
colorscheme molokai
syntax on

"******************************************************************************
"" "                              << Title >>
"******************************************************************************
autocmd BufNewFile *.cpp,*.[ch],*.sh exec ":call SetTitle()"

func SetTitle()
    if (expand("%:e") == 'cpp')
	call setline(1, "/* ")
	call append(line("."), " * File Name: ".expand("%"))
	call append(line(".")+1, " * Descript: ")
	call append(line(".")+2, " * ")
	call append(line(".")+3, " * Version: 1.0 ")
	call append(line(".")+4, " * Created Time: ".strftime("%D %T"))
	call append(line(".")+5, " * Compiler: ")
	call append(line(".")+6, " * Editor: vim ")
	call append(line(".")+7, " * Author: Jimbo ")
	call append(line(".")+8, " * Mail: jimboo.lu@gmail.com ")
	call append(line(".")+9, " *")
	call append(line(".")+10, " * Company: ")
	call append(line(".")+11, " */")
	call append(line(".")+12, " ")
    endif
    if (expand("%:e") == 'h')
	call setline(1, "/*")
	call append(line("."), " * File Name: ".expand("%"))
	call append(line(".")+1, " * Descript: ")
	call append(line(".")+2, " * ")
	call append(line(".")+3, " * Version: 1.0 ")
	call append(line(".")+4, " * Created Time: ".strftime("%D %T"))
	call append(line(".")+5, " * Compiler: ")
	call append(line(".")+6, " * Editor: vim ")
	call append(line(".")+7, " * Author: Jimbo ")
	call append(line(".")+8, " * Mail: jimboo.lu@gmail.com ")
	call append(line(".")+9, " * ")
	call append(line(".")+10, " * Company: ")
	call append(line(".")+11, " */ ")
	call append(line(".")+12, " ")
    endif
"	autocmd BufNewFile * normal G
endfunc

"******************************************************************************
""                                << write >>
"******************************************************************************
inoremap( ()<ESC>i
inoremap[ []<ESC>i
inoremap{ {<ENTER>}<ESC>ko
set autoread
nmap cS :%s/\s+$//g<cr>:noh<cr>
nmap cM :%s/\r$//g<cr>:noh<cr>
imap <c-K> <Up>
imap <c-j> <Down>
imap <c-h> <Left>
imap <c-l> <Right>
" au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
autocmd Vimleave * nested if (!isdirectory($HOME. "/.vim")) |
	\ call mkdir($HOME . "/.vim") |
	\ endif |
	\ execute "mksession!" . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
	\ execute "source " . $HOME . "/.vim/Session.vim"
