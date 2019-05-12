" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

syntax on	" Syntax highlighting

set showcmd	" Show (partial) command in status line.
set showmatch	" Show matching brackets.
set ignorecase	" Do case insensitive matching
set smartcase	" Do smart case matching
set incsearch	" Incremental search
set autowrite	" Automatically save before commands like :next and :make
set hidden	" Hide buffers when they are abandoned

" Custom settings (Linux kernel development default)
set number
set ruler
set tabstop=8
set softtabstop=8
set splitbelow
set splitright
set hlsearch
set encoding=utf-8
set shiftwidth=8
set noshiftround
set showmode
set completeopt=longest,menuone
set laststatus=2
set wrap linebreak nolist
set backspace=indent,eol,start

" Key mappings
nnoremap <F1> :NERDTreeFocus<CR>
nnoremap <F2> :NERDTreeToggle<CR>
" nnoremap <F3> :GitGutterToggle<CR>
nnoremap <F4> :SyntasticToggleMode<CR>

" Color scheme settings
set background=dark
colorscheme Monokai
let g:airline_theme='materialmonokai'
let g:materialmonokai_italic=1
let g:airline_powerline_fonts=1
set t_Co=256
" Line number color
highlight LineNr ctermfg=grey

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
	Plugin 'VundleVim/Vundle.vim' " Plugin manager
	Plugin 'scrooloose/nerdtree' " Filetree inspector
	Plugin 'vim-airline/vim-airline' " Improved status line
	Plugin 'vim-airline/vim-airline-themes' " Status line themes
	Plugin 'tpope/vim-surround' " Shortcuts for surrounding quotes and parens 
	Plugin 'tpope/vim-fugitive' " Git wrapper
	Plugin 'tpope/vim-commentary' " Comment out lines easily
	Plugin 'vim-syntastic/syntastic' " Syntax checker
	Plugin 'airblade/vim-gitgutter' " Visual markers for modified lines
	Plugin 'flazz/vim-colorschemes' " Additional color schemes
	Plugin 'skielbasa/vim-material-monokai' " Material design monokai theme
	Plugin 'xuhdev/vim-latex-live-preview' " Live preview LaTeX documents
	Plugin 'Valloric/YouCompleteMe' " Code completion
	Plugin 'sheerun/vim-polyglot' " Better syntax highlighting
call vundle#end()

" Recommended Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" YouCompleteMe settings
let g:ycm_server_python_interpreter = '/usr/bin/python'

" GitGutter settings
set updatetime=250
let g:gitgutter_highlight_lines=0

" Specify comment strings for other languages and filetypes
fun! OCaml_comment()
    set commentstring=(*\ %s\ *)
endfun
fun! Shell_comment()
    set commentstring=#\ %s
endfun
autocmd FileType ocaml call OCaml_comment()
autocmd FileType sh call Shell_comment()
" Increase refresh frequency for latex live preview plugin
autocmd Filetype tex setl updatetime=1

" Set swap file directory
set directory^=$HOME/.vim/temp/
