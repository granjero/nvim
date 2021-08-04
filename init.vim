call plug#begin('~/.config/nvim/plugged')

	"PHPACTOR
	Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}	
	Plug 'ncm2/ncm2' " Require ncm2 and this plugin
	Plug 'roxma/nvim-yarp'
	Plug 'phpactor/ncm2-phpactor'
	"MONOKAI
	Plug 'phanviet/vim-monokai-pro'
	"NERDTREE
	Plug 'preservim/nerdtree'
	"RAINBOW
	Plug 'luochen1990/rainbow'
	"NERDCOMMENTER
	Plug 'preservim/nerdcommenter'
	"EMMET
	Plug 'mattn/emmet-vim'
	"SUPERTAB
	Plug 'ervandew/supertab'
	"ARPEGGIO
	Plug 'kana/vim-arpeggio'
	"LARAVEL.VIM
	Plug 'tpope/vim-dispatch'
	Plug 'tpope/vim-projectionist'
	Plug 'noahfrederick/vim-composer'
	Plug 'noahfrederick/vim-laravel'

	"agregadp para el curso de poo"
	"GIT
	Plug 'tpope/vim-fugitive'
	"ESLINT
	Plug 'dense-analysis/ale'
	"PRETTIER
	Plug 'prettier/vim-prettier', { 'do': 'npm install' }
	"JEST
	"Plug 'jamestthompson3/vim-jest'

	Plug 'vim-test/vim-test'

call plug#end() 

"MONOKAI
set termguicolors
colorscheme monokai_pro

"LEADER
let mapleader = ","

"NUMEROS DE LINEA
set number

"CIERRA COMILLAS Y CORCHETES
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {{ {{}}<left><left><space><space><left>
inoremap -- ->
inoremap == =>

"TABS Y ESPACIOS VISIBLES
set list listchars=tab:⎸\ ,nbsp:⎕

"TAMAÑO TAB 4 ESPACIOS
set tabstop=2
set shiftwidth=2

"SETEOS DEL CURSOR Y LA LINEA DONDE ESTÁ EL CURSOR
set cursorline 
hi clear CursorLine
hi CursorLine term=underline cterm=underline gui=underline

"NERDTREE
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"RAINBOW
let g:rainbow_active = 1

"NERDCOMMENTER
let g:NERDCreateDefaultMappings = 0
map <leader>cc <plug>NERDCommenterToggle

"EMMET
let g:user_emmet_leader_key=','

"ARPEGGIO GUARDAR
call arpeggio#map('i', '', 0, ',.', '<Esc>:w<CR>')
call arpeggio#map('n', '', 0, ',.', ':w<CR>')

"PHPACTOR
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

call arpeggio#map('n', '', 0, 'op', ':PhpactorGotoDefinition<CR>')
call arpeggio#map('n', '', 0, 'io', ':PhpactorFindReferences<CR>')

"JEST
function! FuzzyJest(trimmed_values) abort
  call fzf#run({
        \ 'source': a:trimmed_values,
        \ 'sink':   function('JestTest'),
        \ 'options': '-m',
        \ 'down': '40%'
        \ })
    call feedkeys('i')
endfunction

function! ListTests() abort
  let g:Jest_list_callback = funcref('FuzzyJest')
  call JestList()
  unlet g:Jest_list_callback
endfunction
