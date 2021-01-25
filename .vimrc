filetype off
call plug#begin('~/.vim/plugged')
	Plug 'Lokaltog/vim-easymotion'
	Plug 'airblade/vim-gitgutter'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'scrooloose/nerdcommenter'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'fatih/vim-go'
	Plug 'morhetz/gruvbox'

" Syntax and linters
	Plug 'gabrielelana/vim-markdown'
	Plug 'leafgarland/typescript-vim'
	Plug 'mfukar/robotframework-vim'
call plug#end()
" Filetype indent with plugin possibility load after vundle to avoid errors
filetype indent plugin on

" Use the Solarized Dark theme
set background=dark
colorscheme gruvbox
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:solarized_termtrans=1

" Make Vim more useful
set nocompatible
set clipboard=unnamedplus

" Enhance command-line completion
set wildmode=longest,list
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" Set up persistent undo across all files.
set hid
set undofile
set undodir=$HOME/.vim/undo

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*
" CoC requirements
"set nobackup
"set nowritebackup
"

" Set history commandline (q:) history size
set history=10000
set viminfo+=:10000

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Highlight current column
set cursorcolumn
" Allow switchin between tabs without save
set hidden
" When using tab convert into spaces/tabstop/shiftwidth
set expandtab
" Set tabsize
set shiftwidth=4
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
"set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Better display for messages
set cmdheight=2

" Set autowrite to leverage go-vims quickfix
set autowrite

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Mappings
" Only tracked files - for source with lot of static
nnoremap <C-L> :GFiles<cr>
" All files
nnoremap <C-p> :FZF<cr>

" Enter after search will cancel highlighting
nnoremap <cr> :noh<cr><cr>

nnoremap <leader>cf :let @*=expand("%")<CR>
nnoremap <leader>cd :let @*=expand("%:h")<CR>
" vim-go
nnoremap <leader>.a :cclose<CR>
nnoremap <leader>.b :GoBuild<cr>
nnoremap <leader>.c :GoCoverageToggle<cr>
nnoremap <leader>.d :GoDecls<cr>
nnoremap <leader>.e :GoErrCheck<cr>
nnoremap <leader>.f :GoFillStruct<cr>
nnoremap <leader>.g :GoDeclsDir<cr>
nnoremap <leader>.k :GoDocBrowser<cr>
nnoremap <leader>.g :GoKeyify<cr>
nnoremap <leader>.l :GoLint<cr>
nnoremap <leader>.m :GoMetaLinter<cr>
nnoremap <leader>.i :GoIfErr<cr>
"nnoremap <leader>.n :cnext<CR>
"nnoremap <leader>.p :cprevious<CR>
nnoremap <leader>.v :GoVet<cr>

" vim-go settings
let g:go_fmt_command    = "goimports"
let g:go_auto_type_info = 1
let g:go_def_mode       = "gopls"
let g:go_info_mode      = "gopls"
let g:go_list_type      = "quickfix"
let g:go_addtags_transform = "camelcase"

" easy motion
let g:EasyMotion_do_mapping = 0
nmap <leader>m <Plug>(easymotion-overwin-f2)

" gitgutter
set updatetime=400

" toggle spell
nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>
nnoremap <leader>t :terminal<CR>

augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"autocmd QuickFixCmdPost *grep* cwindow

command! -nargs=+ Gg execute 'silent grep! -r <args> *' | copen 10

" This file represents the minimal .vimrc needed to work with govim.
"
" We also include a number of suggested settings that we think the majority of
" users will like/prefer.

"set nobackup
"set nowritebackup
"set noswapfile

" To get hover working in the terminal we need to set ttymouse. See
"
" :help ttymouse
"
" for the appropriate setting for your terminal. Note that despite the
" automated tests using xterm as the terminal, a setting of ttymouse=xterm
" does not work correctly beyond a certain column number (citation needed)
" hence we use ttymouse=sgr
" set ttymouse=sgr

" Suggestion: By default, govim populates the quickfix window with diagnostics
" reported by gopls after a period of inactivity, the time period being
" defined by updatetime (help updatetime). Here we suggest a short updatetime
" time in order that govim/Vim are more responsive/IDE-like
set updatetime=500

" Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short
" balloondelay
set balloondelay=250

" Suggestion: Turn on the sign column so you can see error marks on lines
" where there are quickfix errors. Some users who already show line number
" might prefer to instead have the signs shown in the number column; in which
" case set signcolumn=number (requires Vim >= v8.1.1564)
set signcolumn=yes

" this lets you use git-grep(1) for :grep
"set grepprg=git\ grep



" =====================================
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<c-u>coclistresume<cr>