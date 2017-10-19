set nocompatible

""""""""""""
" VIM-PLUG "
""""""""""""
call plug#begin('~/.vim/plugged')

""" STYLE """
" Solarized colors
Plug 'altercation/vim-colors-solarized'
" Status-line
Plug 'bling/vim-airline'
" git-flow in airline
"Plug 'renyard/vim-git-flow-format'

""" USABILITY """
" Fuzzy File Finder
Plug 'kien/ctrlp.vim'
" Searching (:Ack)
Plug 'mileszs/ack.vim'
" Git hooks
Plug 'tpope/vim-fugitive'
" File management (:Move, :Delete etc)
Plug 'tpope/vim-eunuch'
" Auto session saving
Plug 'tpope/vim-obsession'
" Vim pane resizing (Ctrl-e)
Plug 'simeji/winresizer'
" Code-tracing sidebar
Plug 'majutsushi/tagbar'

""" LX-UNSPECIFIC """
" Auto-complete
Plug 'Shougo/deoplete.nvim'
" Auto-complete:golang
Plug 'zchee/deoplete-go', { 'do': 'make'}
" Auto-completion
Plug 'valloric/youcompleteme'

" Syntax checking hacks for vim
"Plug 'scrooloose/syntastic'
" Replaces syntastic
Plug 'benekastah/neomake'

" Surround blocks with delimiters
"Plug 'tpope/vim-surround'
" Replacement for vim-surround
Plug 'machakann/vim-sandwich'

""" LX-SPECIFIC """
" LaTeX support
Plug 'lervag/vim-latex'
" Markdown (.md) support
Plug 'plasticboy/vim-markdown'
" Auto-close ruby blocks
Plug 'tpope/vim-endwise'
" YAML
Plug 'avakhov/vim-yaml'
" Docker syntax highlighting
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}
" GoLang syntax highlighting
Plug 'fatih/vim-go'
" Git changes in gutter
Plug 'airblade/vim-gitgutter'
" JSON syntax highlight
Plug 'leshill/vim-json'
" Puppet syntax highlighting
Plug 'rodjek/vim-puppet'

""" CHECK THESE OUT """
" Undo history visualizer
"Plug 'mbbill/undotree'
" Basic git/searching
"Plug 'junegunn/fzf.vim'

call plug#end()


"""""""""""""""""
" PLUGIN CONFIG "
"""""""""""""""""
" valloric/youcompleteme
" 1 = Disable
let g:loaded_youcompleteme = 0
" Shougo/deoplete.nvim
" 1 = Enable
let g:deoplete#enable_at_startup = 0

" altercation/vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

" NOT SURE WHER THIS IS COMING FROM
" Tabularize
let mapleader=','
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" scrooloose/syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" mileszs/ack.vim
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" Shougo/deoplete.nvim
call deoplete#enable()

" benekastah/neomake
" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000)


"""""""""""
" MY STUFF
"""""""""""

" Not sure what this stuff is
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnt * :Vexplore
"augroup END

" Show control characters
set nolist
" Better control characters
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" Specify <Leader>
let mapleader=","
" Example <Leader> command
"noremap <Leader>W :w !sudo tee % > /dev/null


"""""""""""""""""
" SAMPLE CONFIG "
"""""""""""""""""

" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
"set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
"filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Ignore certain files
set wildignore=*.swp,*.bak,*.pyc

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell
set noerrorbells

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=1

" Display line numbers on the left
set number

" Show numbers relative to your position
"set relativenumber

" Quickly time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200

"These should fix issues in ubuntu with delay in changing modes
set timeout
set timeoutlen=750
set ttimeoutlen=250

"NeoVim handles ESC keys as alt+key set this to solve the problem
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set softtabstop=0
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set shiftwidth=2
set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------

set ff=unix
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

match Error /\%81v.\+/  "error for lines >80 chars


"------------------------------------------------------------
"
" Disable backing up and swap files
set nobackup
set noswapfile

" Set directories (need to be created)
" mkdir ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo
"set undodir=~/.vim/.undo//
"set backupdir=~/.vim/.backup//
"set directory=~/.vim/.swp//
