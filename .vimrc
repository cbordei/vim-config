set nocompatible              " be iMproved, required
filetype off                  " required

set t_Co=256
set number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rails'                    " All kinds of rails things
Plugin 'scrooloose/nerdtree'                " File browser
Plugin 'matze/vim-move'
Plugin 'gioele/vim-autoswap'              " Stop bugging me about swap files
Plugin 'tpope/vim-fugitive'                 " Git plugin
Plugin 'airblade/vim-gitgutter'             " Shows git status in left gutter
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" Nerd tree configs
let NERDTreeMapOpenInTab='<ENTER>'
map <silent> <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" Automatically close vim if NERDTree is the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
" Syntax highlighting
syntax enable
filetype plugin indent on

" see file status
set statusline+=%F

" Set tabs to two spaces 
set expandtab 
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start            " allow backspacing over
" everything in insert mode
set ignorecase smartcase
set gdefault                              " assume the /g flag on :s
" substitutions to replace all matches in a line

" Configure CtrlP
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" Configure status line
set laststatus=2

" Style vim and plugins
syntax enable
colorscheme monokai

" bind K to grep word under cursor
nnoremap K :Ack "\b<C-R><C-W>\b"<CR>:cw<CR>

" <Leader>s to replce word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Always show at least 5 lines above/below cursor
set scrolloff=5

" Enable Tab and Shift+Tab to indent/unindent code
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Enable cursorline
let g:conoline_auto_enable = 1
let g:conoline_color_normal_dark = 'ctermbg=23 ctermfg=white'
let g:conoline_color_insert_dark = 'ctermbg=30 ctermfg=white'

" Enable Tab and Shift+Tab to indent/unindent code
"nnoremap <Tab> >>_
"nnoremap <S-Tab> <<_
"inoremap <S-Tab> <C-D>
"vnoremap <Tab> >gv
"vnoremap <S-Tab> <gv

" Insert pry or remote-pry
nmap <leader>bp orequire 'pry'; binding.pry<esc>^
nmap <leader>brp orequire 'pry'; binding.remote_pry<esc>^

" I should feel bad about this
set mouse=a

" Use Ctrl+p to launch fzf (because habits)
nnoremap <C-p> :Files<CR>
nnoremap <C-space> :Buffers<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

