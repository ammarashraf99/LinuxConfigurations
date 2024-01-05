let mapleader=" "

if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif


" stop auto commenting
set formatoptions-=r formatoptions-=c formatoptions-=o




syntax on
set nocompatible
filetype plugin on


"set filetype

set incsearch
set background=dark
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set expandtab    "-----> problem with this is in makefiles
set nowrap

" status bar
set laststatus=2


" sets default clipboard to the system clipboard
set clipboard=unnamedplus

" colorscheme gruvbox
set encoding=utf-8

" File Browsing:
" Tweaks for browsing
let g:netrw_banner=0		" disable annoying banner
let g:netrw_browse_split=4	" open in prior window
let g:netrw_altv=1			" open splits to the right
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',/(^\|\s\s\)zs\.\S\+'

" NOW WE CAN
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings





" Enable autocompletion ctrl+n to activate:

" Fix splitting
set splitbelow splitright

" Automatically delets all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" time out
set timeout         " time out for key codes
set timeoutlen=200  " wait up to 100ms after Esc for special key

"backup settings
set backupdir=/tmp
set directory=~/.vim/tmp,.
set backup


"persistant undo between opening and closing files
set undofile





map <F2> :bprev<CR>
map <F3> :bnext<CR>
"here you can source vimrc using F5
map <F5> :source ~/.vimrc<CR>



" Replace words.
" stand with the cursor on the you want to replace
" and then hit the keybinding and write the replacment
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Adjusting vim windows sizes
nnoremap <Up>	:resize +2<CR>
nnoremap <Down>	:resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>



" column set to column 100
set colorcolumn=100

" column color set to grey
highlight colorcolumn ctermbg=1

set mouse=a
set number relativenumber

"set termguicolors

""""" colorscheme good list
 " materialbox
 " carbonized-dark
 " gruvbox
"set termguicolors
colorscheme gruvbox
set cursorline



" this makes the Alt key equal to M
"execute "set <M-d>=\ed"


" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" paste remap ..
xnoremap("<leader>p", "\"_dP")



" Shortcut split opening
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

" Terminal shortcut
nnoremap <leader><cr> :terminal<cr>


" NERDTree map
nnoremap <C-n> :NERDTreeToggle<cr>


" Files (runs $FZF_DEFAULT_COMMAND if defined)
nmap <leader><leader>f :Files<cr>



" Line commenter
nnoremap <leader><leader>c :call NERDComment(0,"toggle")<CR>
vnoremap <leader><leader>c :call NERDComment(0,"toggle")<CR>


" FZF
nnoremap <C-p> :Files<Cr>
nnoremap <leader>f :Buffer<Cr>
nnoremap <leader>n :bnext<Cr>
" nnoremap <leader>p :bprev<Cr>




"		VIMWIKI
let wiki_1 = {}
let wiki_1.path = '~/Documents/notes/'
let wiki_2 = {}
let wiki_2.path = '~/Documents/notes/'
let g:vimwiki_list = [wiki_1, wiki_2]

" Colorscheme (For gruvbox $TERM env var needs to be xterm-256color)
autocmd vimenter * ++nested colorscheme gruvbox

"this is for lightline.vim plugin
let g:lightline = {'colorscheme':'gruvbox'}





"Use a line cursor within insert mode and a block cursor everywhere else.
" Reference chart of values:
" Ps = 0 -> blinking block.
" Ps = 1 -> blinking block (defautl).
" Ps = 2 -> steady block.
" Ps = 3 -> blinking underline.
" Ps = 4 -> steady underline.
" Ps = 5 -> blinking bar (xterm).
" Ps = 6 -> steady bar (xterm).
let &t_SI = "\e[2 q"
let &t_ei = "\e[2 q"




















