set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
syntax on
filetype off

Plugin 'gmarik/vundle'

" UI
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'flazz/vim-colorschemes'
Plugin 'ujihisa/unite-colorscheme'

" Fuzzy search
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'thinca/vim-unite-history'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'

" Code completion
"Plugin "MarcWeber/vim-addon-mw-utils"
"Plugin "tomtom/tlib_vim"
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'mattn/emmet-vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" File browsing
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

" Syntax
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'jnwhiteh/vim-golang'
Plugin 'groenewege/vim-less'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-scripts/scons.vim'
Plugin 'juvenn/mustache.vim'

" git
Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'

" misc
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'

Plugin 'vim-scripts/align'
Plugin 'tpope/vim-surround'
Plugin 'gregsexton/matchtag'
Plugin 'vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700           " sets how many lines of history vim has to remember
set autoread              " set to auto read when a file is changed from the outside

let mapleader = ","
let g:mapleader = ","

nmap ; :

" fast saving
nmap <leader>w :w!<cr>

" fast quitting 
nmap <leader>q :q<cr>
nmap <leader>x :qa!<cr>


" fast run makefile
nnoremap <leader>m :silent make\|redraw!\|cc<cr>

" fast mode change
set timeoutlen=300 ttimeoutlen=50 

" fast buffer alternation
noremap <leader><leader> <c-^>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set so=7                       " set 7 lines to the cursor - when moving vertically using j/k
set wildmenu                   " turn on the wild menu, better command completion
set wildignore=*.o,*~,*.pyc    " ignore compiled files
set ruler                      " always show current position
set cmdheight=1                " height of the command bar
set hid                        " a buffer becomes hidden when it is abandoned
set backspace=eol,start,indent " configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set ignorecase                 " ignore case when searching
set smartcase                  " when searching try to be smart about cases
set hlsearch                   " highlight search results
set incsearch                  " makes search act like search in modern browsers
set lazyredraw                 " don't redraw while executing macros (good performance config)
set magic                      " for regular expressions turn magic on
set showmatch                  " show matching brackets when text indicator is over them
set mat=2                      " how many tenths of a second to blink when matching brackets
set fillchars+=vert:\          " window split styling
set cursorline

autocmd winleave * setlocal nocursorline
autocmd winenter * setlocal cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable            " enable syntax highlighting
set background=dark      " default dark background
colorscheme wombat256mod " molokai xoria256
set t_co=256             " enable 256 colours
set encoding=utf8        " set utf8 as standard encoding and en_us as the standard language
set ffs=unix,dos,mac     " use unix as the standard file type

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup " turn backup off, since most stuff is in svn, git et.c anyway...
set nowb
set noswapfile

if exists('+undofile')
  set undofile
  set undodir=~/.vim/.cache/undo
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab     " use spaces instead of tabs
set smarttab      " be smart when using tabs ;)
set shiftwidth=2  " setup default ts
set tabstop=2
set softtabstop=2
set lbr           " linebreak on 500 characters
set tw=500
set ai            " auto indent
set si            " smart indent
set wrap          " wrap lines
set mouse=nicr    " remove me
set mousehide
set number        " line numbers
set list
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮
set linebreak
let &showbreak='↪ '
set iskeyword-=_  " word breaks around underscores

set scrolljump=5 "minimum number of lines to scroll
set ttyfast
set viewoptions=folds,options,cursor,unix,slash     "unix/windows compatibility


""""""""""""""""""""""""""""""
" => visual mode related
""""""""""""""""""""""""""""""

" retain visual selection after identing
vnoremap < <gv
vnoremap > >gv

" smash escape
inoremap jk <esc>
inoremap kj <esc>

" yank to clipboard 
nnoremap <c-y> "+y
vnoremap <c-y> "+y

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" home row jump to start and end of line
noremap h ^
noremap l $

" map <space> to / (search) and ctrl-<space> to ? (backwards search)
map <space> /
map <c-space> ?

" disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" smart way to move between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" unmap arrow keys
noremap <up> <c-w>k
noremap <down> <c-w>j
noremap <left> :bprev <cr>
noremap <right> :bnext<cr>

" adjust viewports to the same size
map <leader>= <c-w>=

" specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" set viminfo^=% " remember info about open buffers on close

""""""""""""""""""""""""""""""
" => status line
""""""""""""""""""""""""""""""
set laststatus=2 " always show the status line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remap vim 0 to first non-blank character
map 0 ^

autocmd bufwrite *.py :call deletetrailingws()
autocmd bufwrite *.coffee :call deletetrailingws()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remove the windows ^m - when the encodings gets messed up
noremap <leader>m mmhmt:%s/<c-v><cr>//ge<cr>'tzt'm

" todo: revise paste options
" toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Paste toggles
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5> " Hit f5 before pasting into terminal

" Relative line numbering
nnoremap <C-n> :NumbersToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
:nmap ,e :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Pmenu ctermbg=238 gui=bold

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_working_path_mode = 'ra'  " search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 1   " show the match window at the top of the screen
let g:ctrlp_max_height = 8      " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'    " jump to a file if it's open already
let g:ctrlp_use_caching = 1       " enable caching
let g:ctrlp_clear_cache_on_exit=0     " speed up by not removing clearing cache evertime
let g:ctrlp_show_hidden = 1       " show me dotfiles
let g:ctrlp_mruf_max = 250        " number of recently opened files


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:unite_source_history_yank_enable = 1
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_source_rec_max_cache_files=5000
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ ], '\|'))


nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <leader>f :Unite file_rec<cr>
nnoremap <leader>c :Unite colorscheme -auto-preview<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  "imap <buffer> <C-j> <NOP>
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_always_populate_loc_list=1

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

map <leader>x :Errors<CR>
map <leader>a :%!astyle --mode=c --style=ansi -s2 <CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufferline_echo=0
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Emmet 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
imap <C-e> <C-y>,

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EasyMotion 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap s <Plug>(easymotion-s)
nmap t <Plug>(easymotion-t2)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Golang 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType go autocmd BufWritePre <buffer> Fmt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Supertab + Omnicomplete 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
let g:clang_complete_copen = 1
let g:clang_snippets = -1
let g:clang_use_library = 1
map <leader>a :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete Plugin
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_DisplayMode         = 1
let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
let OmniCpp_ShowAccess          = 1 "show access in pop-up
let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
set completeopt=menuone,menu,longest
 let g:SuperTabDefaultCompletionType = "<C-X><C-O>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gundo 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1
nnoremap <leader>g :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

