call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdtree'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fugitive'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'Chiel92/vim-autoformat'

Plug 'chrisbra/improvedft'

"Plug 'Rip-Rip/clang_complete'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

set shiftwidth=4
set termguicolors
set background=dark
set number
set scrolloff=5
set ignorecase
set smartcase
set autoindent
set splitbelow
set splitright
set tw=80 "Text width, probably only want this for code, should be looked at further
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 "Tabs
"set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab "2 spaces
syntax on

let mapleader=" "

colorscheme gruvbox

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>k
"tnoremap <C-\> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
noremap <leader>c :noh<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<CR>
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR> 
noremap <F3> :Autoformat<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

"let g:python_host_prog = '/usr/bin/python'
"let g:python3_host_prog = '/usr/bin/python3'
let g:autoformat_autoindent = 0
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0
let g:clang_use_library = 1
