" .vimrc File
" Maintained by: Jeffrey Way
" jeffrey@jeffrey-way.com
" http://net.tutsplus.com
"
"Enable Pathogen Package Manager"
execute pathogen#infect()

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
"set mapleader = ",";

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

"Switch between buffers without saving
set hidden

"Set the color scheme. Change this to your preference. 
"Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
colorscheme base16-default
set background=dark

"Set font type and size. Depends on the resolution. Larger screens, prefer h15
set guifont=Monaco:h18

"Tab stuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

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

"Hide MacVim toolbar by default
set go-=T

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

"Saves time; maps the spacebar to colon
nmap <space> :

"Automatically change current directory to that of the file in the buffer
" autocmd BufEnter * cd %:p:h

"Map code completion to , + tab
imap ,<tab> <C-x><C-o>

" More useful command-line completion
" set wildmenu

"Auto-completion menu
" set wildmode=list:longest

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" set completeopt=longest,menuone
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

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
"
" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

"-------------------------" 
" NERDTREE SETTINGS
" ------------------------"
autocmd VimEnter * NERDTree | wincmd p
let g:NERDTreeWinPos = "right"

"--------------------------"
" PERSONAL SETTINGS 
" -------------------------"
"Example for adding abbreviations - triggered by the spacebar.
iabbrev mysite ftp://jeff-way.com@jeffrey-way.com/domains/

"Shortcut for logging into my server
nmap ,server :Nread ftp://jeff-way.com@jeffrey-way.com/domains/<cr>

"Shortcut directly to my theme files on server
nmap ,theme :Nread ftp://jeff-way.com@jeffrey-way.com/domains/jeffrey-way.com/html/wp-content/themes/magazineJW/<cr>

"For autocompletion of Snipmate plugin
"let g:acp_behaviorSnipmateLength = 1

"Peep open
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <c-o> <Plug>PeepOpen
end

# Add Code Folding for Javascript
au FileType javascript call JavaScriptFold()
