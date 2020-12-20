set nocompatible

""""""""""""
" VIM-PLUG "
""""""""""""

" auto-install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" EXAMPLES
" Keep Plugin commands between vundle#begin/end.
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}


" ctags integrataion
Plug 'powerline/powerline-fonts'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" Solarized colors
Plug 'altercation/vim-colors-solarized'
" Fuzzy File Finder
Plug 'kien/ctrlp.vim'
" generic fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Status-line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
" GIT hooks
Plug 'tpope/vim-fugitive'
" Rename current buffer `:rename[!] {newname}`
" BUGGED
"Plug 'danro/rename.vim'
" unix shell mappings (e.g. `:Move`
Plug 'tpope/vim-eunuch'

" LaTeX support
Plug 'lervag/vimtex'
"FIXES vimtex: g:tex_flavor not specified

"Please read :help vimtex-tex-flavor!
let g:tex_flavor = "latex"

" TOML (.toml) support
Plug 'cespare/vim-toml'
" Markdown (.md) support
Plug 'plasticboy/vim-markdown'
" Typescript
Plug 'leafgarland/typescript-vim'
" Auto-close ruby blocks
Plug 'tpope/vim-endwise'
" Auto session saving
Plug 'tpope/vim-obsession'
" YAML
"Plug 'chase/vim-ansible-yaml'
Plug 'avakhov/vim-yaml'
" Docker syntax highlighting
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plug 'mattn/emmet-vim'
" python syntax
Plug 'psf/black', { 'branch': 'stable' }

" Golang autocompletion
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" GoLang syntax highlighting
Plug 'fatih/vim-go'

"Plug 'vim-hclfmt'
"let g:hcl_fmt_autosave = 0
"let g:tf_fmt_autosave = 0
"let g:nomad_fmt_autosave = 0

" Syntax checking hacks for vim
"Plug 'scrooloose/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" not sure what this does. Replaces syntastic?
"Plug 'benekastah/neomake'

" Path explorer
"Plug 'scrooloose/nerdtree'

" Surround blocks with delimiters
Plug 'tpope/vim-surround'

" git-flow in airline
Plug 'renyard/vim-git-flow-format'

" auto delimiter closing
Plug 'vim-scripts/delimitMate.vim'

" b:uffer explorer
"Plug 'fholgado/minibufexpl.vim'

" NERDTree for tabs
"Plug 'jistr/vim-nerdtree-tabs'

" Line up code
Plug 'godlygeek/tabular'
let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" vim searching
Plug 'mileszs/ack.vim'

" gutter git information
" ,[c   next hunk
" ,hs   stage hunk
" ,hs   undo stage hunk
" :GitGutterLineHighlightsEnable
Plug 'airblade/vim-gitgutter'

" json syntax highlightage
Plug 'leshill/vim-json'

" vim indent consitency
"Plug 'vim-scripts/IndentConsistencyCop'

" Code Autocompletion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Go code autocompletion
Plug 'zchee/deoplete-go', { 'do': 'make'}
let g:deoplete#sources#go#gocode_binary       = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#package_dot         = 1 "auto-add dot after package
let g:deoplete#sources#go#sort_class          = [] "primary sort class (package type func var const)
let g:deoplete#sources#go#cgo                 = 0
let g:deoplete#sources#go#goos                = ''
let g:deoplete#sources#go#source_importer     = 0 " leave disabled
let g:deoplete#sources#go#builtin_objects     = 0
let g:deoplete#sources#go#unimported_packages = 0
let g:deoplete#sources#go#pointer             = 0 " upport pointer (*) match
set completeopt-=preview " hide scratch buffer
"set completeopt+=noselect

" Autocompletion
" BUG: Needs NeoVim Integration
" heavy-handed?
"Plug 'Valloric/YouCompleteMe'

" ctrl-e winresizer
Plug 'simeji/winresizer'
let g:winresizer_enable             = 1   " use winresizer (if this value is 0, this plugin will not work)
let g:winresizer_gui_enable         = 0   " use winresizer in gui vim (if this value is 0, this plugin will not work in gui vim such as mac vim)
let g:winresizer_finish_with_escape = 1   " if this value is 1, window resize mode is finished(fixed) by esc
let g:winresizer_vert_resize        = 10  " the change width of window size when left or right key is pressed
let g:winresizer_horiz_resize       = 3   " the change height of window size when down or up key is pressed
" let g:winresizer_start_key          = C   " + e 	Start window resize mode
" let g:winresizer_gui_start_key      = C   " + a 	Start window resize mode (in GUI Vim)
let g:winresizer_keycode_left       = 104 " (h) 	Expand window size to left
let g:winresizer_keycode_right      = 108 " (l) 	Expand window size to right
let g:winresizer_keycode_down       = 106 " (j) 	Expand window size to down
let g:winresizer_keycode_up         = 107 " (k) 	Expand window size to up
let g:winresizer_keycode_focus      = 102 " (f) 	Change a mode to Focus mode
let g:winresizer_keycode_move       = 109 " (m) 	Change a mode to Move mode
let g:winresizer_keycode_resize     = 114 " (r) 	Change a mode to Resize mode
let g:winresizer_keycode_mode       = 101 " (e) 	Rotate a mode (Resize -> Move -> Focus -> Resize ...)
let g:winresizer_keycode_finish     = 13  " (Enter) 	Fix and escape from window resize mode
let g:winresizer_keycode_cancel     = 113 " (q) 	Cancel and quit window resize mode<Paste>

"""""""""""
" TESTING "
"""""""""""

" godot hooks
Plug 'habamax/vim-godot'
func! GodotSettings() abort
    setlocal foldmethod=expr
    setlocal tabstop=4
    nnoremap <buffer> <F4> :GodotRunLast<CR>
    nnoremap <buffer> <F5> :GodotRun<CR>
    nnoremap <buffer> <F6> :GodotRunCurrent<CR>
    nnoremap <buffer> <F7> :GodotRunFZF<CR>
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end

" HTML Syntax
Plug 'mattn/emmet-vim'
" Ruby syntax/indenting
Plug 'vim-ruby/vim-ruby'
"
" Block Commenting
" ,cc   comment
" ,cn   comment w/ nesting
" ,c<space>   comment toggle
Plug 'scrooloose/nerdcommenter'
"let g:NERDSpaceDelims            = 1 " Add spaces after comment delimiters by default
"let g:NERDCompactSexyComs        = 1 " Use compact syntax for prettified multi-line comments
"let g:NERDDefaultAlign           = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDAltDelims_java         = 1 " Set a language to use its alternate delimiters by default
"let g:NERDCustomDelimiters       = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
"let g:NERDCommentEmptyLines      = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
"let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
"let g:NERDToggleCheckAllLines    = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not


Plug 'hashivim/vim-terraform'


" Block commmenting
call plug#end()

"filetype plugin on

"""""""""""""""""
" PLUGIN CONFIG "
"""""""""""""""""

" altercation/vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

" kien/ctrlp
let g:ctrlp_show_hidden = 1

" NERDTree
"map <C-n> :NERDTreeToggle<CR>
" NERDTreeTabs
"map <Leader>n <plug>NERDTreeTabsToggle<CR>
"map <C-n> <plug>NERDTreeTabsToggle<CR>

" ACK
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" YouCompleteMe
autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>

"""""""""""
" MY STUFF
"""""""""""

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
" syntax on


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

" Display relative line numbers
set norelativenumber

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
