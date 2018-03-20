" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd     " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set autowrite       " Automatically save before commands like :next and :make
set hidden      " Hide buffers when they are abandoned
set mouse=a     " Enable mouse usage (all modes)

" Auto indentation on save
set smartindent
augroup autoindent
  au!
  autocmd BufWritePre * :normal migg=G`i
augroup End

" Set swap file directory
set directory^=$HOME/.vim/temp//

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Custom settings
set number
set ruler

set splitbelow
set splitright

set tabstop=4
set softtabstop=4
set expandtab

set hlsearch
set nocompatible

set autoindent

set encoding=utf-8
set shiftwidth=2
set noshiftround

set showmode
set showcmd

set completeopt=longest,menuone

set laststatus=2
set wrap linebreak nolist
set breakindent

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
" set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
" set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
" let g:tex_flavor='latex'
" let g:Tex_ViewRule_pdf='AcroRd32'
" let g:Tex_ViewRule_ps='gsview32'
" let g:Tex_ViewRule_dvi='yap -1'
" let g:Tex_DefaultTargetFormat='pdf'

" Key mapping
nnoremap <F1> :NERDTreeFocus<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :GitGutterToggle<CR>
nnoremap <F4> :SyntasticToggleMode<CR>

" Vundle plugins
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround' " Easily work with surrounding parens, quotes, etc.
Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'tpope/vim-commentary' " Comment out lines easily
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'lifepillar/vim-mucomplete' 
Plugin 'davidhalter/jedi-vim'
Plugin 'skielbasa/vim-material-monokai'
" LaTeX plugins
" Plugin 'Chiel92/vim-autoformat'
" Plugin 'lervag/vimtex'
call vundle#end()

" Color scheme
set background=dark
colorscheme Tomorrow-Night-Bright
let g:airline_theme='materialmonokai'
let g:materialmonokai_italic=1

" Line number color
highlight LineNr ctermfg=grey

"Airline settings
let g:airline_powerline_fonts=1

" Recommended Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" GitGutter settings
set updatetime=250
let g:gitgutter_highlight_lines=0

" vim-javascript settings
" let g:javascript_plugin_jsdoc = 1

" mucomplete settings
set completeopt+=menuone
set completeopt+=noselect
set completeopt+=noinsert
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1
