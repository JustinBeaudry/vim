"
" Justin Beaudry https://github.com/JustinBeaudry/vim/
" derived from GabeSoft (https://github.com/gabesoft/dotfiles)
" & Jeffrey Way
"

" ----------------"
" ENABLE PATHOGEN
" ----------------"
execute pathogen#infect()

" ----------------"
" SET $VIMHOME
" ----------------"
let $VIMHOME=expand('<sfile>:p:h')

" ---------------"
" SETUP OS NAMES
" ---------------"
silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win16') || has('win32') || has('win64'))
endfunction

" -----------------"
" SET BASE VIM DIR
" -----------------"
let $VIMHOME=expand('<sfile>:p:h')
if WINDOWS()
    let $VIMHOME=expand('$VIMHOME/vimfiles')
elseif OSX()
    let $VIMHOME=expand('$VIMHOME/.vim')
else
    let $VIMHOME=expand('$VIMHOME/.vim')
endif

"Forget compatibility with Vi. Who cares.
set nocompatible

"Enable filetypes
filetype on
filetype plugin indent on
syntax on

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in lower right corner.
set ruler

"Want a different map leader than \
"set mapleader = ".";

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

"Switch between buffers without saving
set hidden

"Set the color scheme. Change this to your preference. 
"Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
set background=dark

"Set font type and size. Depends on the resolution. Larger screens, prefer h15
set guifont=Consolas:h12

"Tab stuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number

"Prefer relative line numbering?
"set relativenumber"

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Better line wrapping 
set wrap
set textwidth=79
set formatoptions=qrn1

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip

"Enable code folding
set foldenable

"Hide mouse when typing
set mousehide

"Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf

" Create dictionary for custom expansions
set dictionary+=/Users/Home/.vim/dict.txt

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Split windows below the current window.
set splitbelow              

"Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Set up an HTML5 template for all new .html files
"autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

"Load the current buffer in Firefox - Mac specific.
abbrev ff :! open -a firefox.app %:p<cr>

"Map a change directory to the desktop - Mac specific
nmap ,d :cd ~/Desktop<cr>:e.<cr>

"Shortcut for editing  vimrc file in a new tab
nmap ,ev :tabedit $MYVIMRC<cr>

"Change zen coding plugin expansion key to shift + e
let g:user_zen_expandabbr_key = '<C-e>'

"Faster shortcut for commenting. Requires T-Comment plugin
map ,c <c-_><c-_>

"Toggle the NERDTree
map <tab> :NERDTreeToggle<cr>

"Saves time; maps the spacebar to colon
nmap <space> :

"Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

"Map code completion to , + tab
imap ,<tab> <C-x><C-o>

" More useful command-line completion
set wildmenu

"Auto-completion menu 
set wildmode=list:longest

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"Map escape key to jj -- much faster
imap jj <esc>

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" ---------------------------------------"
"  <ENTER> INSERT NEW LINE w/ out INSERT
" ---------------------------------------"
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" -----------------
" WINDOW NAVIGATION
" -----------------
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"-------------------------" 
" NERDTREE SETTINGS
" ------------------------"
let g:NERDTreeWinPos = "right"

"--------------------------"
" COLORSCHEME | GUI & TERM 
" -------------------------"
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <c-o> <Plug>PeepOpen
  colorscheme base16-eighties
 
  "Map Command Key
  nmap <D-t> :tabnew
  nmap <D->> :vnew
  nmap <D-h> :nohl

  "Hide MacVim toolbar by default
  set go-=T

  "Toggle the FuzzyFinder 
  nmap , :CtrlP<cr>

  "256 Colors
  set t_Co=256
  "Maximize Window
  set lines=999 columns=999
else
  colorscheme twilight
end

" ------------------------"
" SET TO CLIPBOARD
" ------------------------"
if has('clipboard')
    set clipboard=unnamed
endif

" -----------------------"
" SET TMP AND UNDO
" -----------------------"
set backup
set backupskip=/tmp/*,/private/tmp/*"   "make vim able to edit crontab files

if has('persistent_undo')
  set undofile
  set undolevels=2000
  set undoreload=10000
endif

set showmatch
set matchtime=2

" ------------------------"
" POWERLINE STATUS BAR
" ------------------------"
let g:powerline_config_path = expand($VIMHOME) . '/config/powerline'
let g:Powerline_symbols = 'unicode'
set rtp+=$VIMHOME/bundle/powerline/powerline/bindings/vim
set noshowmode
set fillchars+=stl:\ ,stlnc:\
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/

" ------------------------"
" REMOVE TRAILING WHITESPACE
" ------------------------"
autocmd BufWritePre *.py :%s/\s\+$//e

" -----------------------"
" USE AG (SILVER SURFER)
" -----------------------"
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
