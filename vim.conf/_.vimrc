let mapleader=" "

if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif



syntax on
set nocompatible

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

" Enable autocompletion ctrl+n to activate:
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright

" Automatically delets all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" time out
set timeout         " time out for key codes
set timeoutlen=200  " wait up to 100ms after Esc for special key

"backup settings
set backupdir=/tmp/vim.backup
set directory=~/.vim/tmp,.
set backup



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
colorscheme gruvbox
set cursorline

" Autocompletion
set wildmode=longest,list,full



" this makes the Alt key equal to M
"execute "set <M-d>=\ed"


" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcut split opening
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

" Terminal shortcut
nnoremap <leader><cr> :terminal<cr>


" NERDTree map
nnoremap <C-n> :NERDTreeToggle<cr>



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
let &t_EI = "\e[2 q"




"		VIMWIKI
let wiki_1 = {}
let wiki_1.path = '~/Documents/notes/'
let wiki_2 = {}
let wiki_2.path = '~/Documents/notes/'
let g:vimwiki_list = [wiki_1, wiki_2]



