set nocompatible

call plug#begin('~/.vim/bundle')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'duggiefresh/vim-easydir'
Plug 'tpope/vim-rsi'
Plug 'sjl/gundo.vim'
Plug 'aperezdc/vim-template'
Plug 'ap/vim-css-color', {'for': 'css'}
Plug 'rust-lang/rust.vim', {'for': 'rs'}
Plug 'pangloss/vim-javascript', {'for': 'js'}
Plug 'mxw/vim-jsx', {'for': 'js'}
Plug 'hynek/vim-python-pep8-indent', {'for': 'py'}
Plug 'elixir-lang/vim-elixir', {'for': 'ex'}
Plug 'ElmCast/elm-vim', {'for': 'elm'}
Plug 'lervag/vimtex', {'for': ['tex', 'latex']}
Plug 'chase/vim-ansible-yaml', {'for': 'yaml'}
call plug#end()

" misc
syntax enable
set background=dark
colorscheme solarized

set noshowmode

set timeout
set timeoutlen=250
set ttimeout
set ttimeoutlen=0

set autoread
set nu

set incsearch
set showmatch

set expandtab
set shiftwidth=4
set tabstop=4

set noerrorbells
set visualbell
set t_vb=

if has('mouse')
    set mouse=a
endif

" backup, swap, undo
if isdirectory($HOME . '/.vim/tmp/backup') == 0
    :silent !mkdir -p ~/.vim/tmp/backup >/dev/null 2>&1
end
set backupdir=~/.vim/tmp/backup//

if isdirectory($HOME . '/.vim/tmp/swap') == 0
    :silent !mkdir -p ~/.vim/tmp/swap >/dev/null 2>&1
endif
set directory=~/.vim/tmp/swap//

if isdirectory($HOME . '/.vim/tmp/undo') == 0
    :silent !mkdir -p ~/.vim/tmp/undo > /dev/null 2>&1
endif
set undodir=~/.vim/tmp/undo//

" Filetype prefs
autocmd Filetype c setlocal ts=2 sts=2 sw=2
autocmd BufNewFile,BufRead *.json setlocal filetype=javascript
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" Auto remove trailing whitespace (this is desirable almost 100% of the time)
autocmd FileType c,cpp,python,ruby,java,elixir,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e

" remaps
inoremap fd <ESC>
vnoremap fd <ESC>

nnoremap <silent> j gj
nnoremap <silent> k gk

set pastetoggle=<F2>

" leader
let mapleader = "\<SPACE>"
let g:mapleader = "\<SPACE>"

nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>qq :q!<cr>:quit<cr>
nmap <leader>wq :wq!<cr>

nmap <leader>tn :tabnext<cr>
nmap <leader>tp :tabprev<cr>
nmap <leader>to :tabnew<cr>
nmap <leader>tc :tabclose<cr>

nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>e :enew<cr>
nmap <leader>bd :bd<cr>

nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>h <C-w>h
nmap <leader>l <C-w>l

" fzf
let g:fzf_command_prefix='Fzf'
nmap <leader>f :FzfFiles<cr>
nmap <leader>bb :FzfBuffers<cr>
nmap <leader>g :FzfLines<cr>

" NERDtree
map <leader><leader> :NERDTreeToggle<cr>
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * lcd %:p:h
let NERDTreeQuitOnOpen=1

" NERDcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" gundo
nnoremap <leader>u :GundoToggle<cr>
let g:gundo_right=1

" dwm
let g:dwm_map_keys=0
let g:dwm_master_pane_width="60%"
nnoremap <silent><leader>o :call DWM_New()<cr>
nnoremap <silent><leader>d :call DWM_Focus()<cr>
nnoremap <silent><C-l> :call DWM_GrowMaster()<cr>
nnoremap <silent><C-h> :call DWM_ShrinkMaster()<cr>

"Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent><leader>z :ZoomToggle<CR>

" airline
set laststatus=2
let g:airline_powerline_fonts=1
" let g:airline_theme="murmur"
let g:airline_theme="solarized"

" syntastic
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" ansible
let g:ansible_options = {'ignore_blank_lines': 0}

" vimtex
let g:vimtex_latexmk_callback=0
let g:vimtex_latexmk_continuous=0
let g:vimtex_latexmk_options = "-pdf"

" vim-template
let g:templates_directory = ['~/.vim/templates']

" vim-jsx
let g:jsx_ext_required = 0

" elm-vim
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0
