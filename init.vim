" PLUGINS  =========================================================
call plug#begin('~/.config/nvim/plugged')
	" NerdTree
	Plug 'preservim/nerdtree'
	" Rainbow parentesis
	Plug 'luochen1990/rainbow'
	" Nerd Commenter
	Plug 'preservim/nerdcommenter'
	" Emmet-vim
	Plug 'mattn/emmet-vim'
	" newer language support"''
	"Plug 'sheerun/vim-polyglot'         
	" supertab
	Plug 'ervandew/supertab'
	" php autocomplete
	Plug 'shawncplus/phpcomplete.vim'
	
	"NCM2
	Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
	"Plug 'phpactor/ncm2-phpactor'

call plug#end() 
" FIN PLUGINS  =====================================================


" CONFIGURACIONES  =================================================
"
" Generales ----------------
filetype plugin indent on


" activa el autocomplete de vim
"set omnifunc=phpcomplete#CompletePHP

"auto FileType php 

" nros de linea
set number
" linea actual
set cursorline
" tab cuatro espacios
set tabstop=4
"set softtabstop=0 noexpandtab
set shiftwidth=4


"tabs y espacios visibles
set list listchars=tab:⎸\ ,nbsp:⎕

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Cerrar corchetes y comillas
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

"set completeopt=noinsert,menuone,noselect

" SUPERTAB ----------------
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"


" NERDTREE ----------------
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" para que nerdtree abra directorios
let NERDTreeMapActivateNode='v'
" para que ctrl + n abra el tree
map <C-n> :NERDTreeToggle<CR>

" RTAINBOW ----------------
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" NERDCOMMENTER -----------
" previene los defaults del plugin
let g:NERDCreateDefaultMappings = 0
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'php': { 'left': '//', 'leftAlt': '<!--', 'right': '','rightAlt': '-->' } }
" remapea a lo que me gusta
map ,cc <plug>NERDCommenterToggle
""map ,cv <plug>NERDCommenterAltDelims 
map ,cv <plug>NERDCommenterAltDelims <plug>NERDCommenterToggle <plug>NERDCommenterAltDelims

" EMMET ------------------
" remapea para emmet 
"let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_leader_key=','

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
