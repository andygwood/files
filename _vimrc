
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/MarSoft/nerdtree-grep-plugin.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/bronson/vim-trailing-whitespace.git'
Plug 'https://github.com/evidens/vim-twig.git'
Plug 'https://github.com/flazz/vim-colorschemes.git'
call plug#end()

syntax on
colorscheme elflord
filetype plugin indent on
set laststatus=2
""autocmd vimenter * NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
nmap <C-a> :NERDTreeToggle<CR>
set runtimepath^=~/.vim/bundle/ctrlp.vim
set relativenumber
set number
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
set mouse=a
hi CursorLine     guibg=#222222 gui=none
hi LineNr         ctermfg=darkgrey guifg=#666666 guibg=#000000
set listchars=nbsp:*,tab:>-,trail:~,extends:>,precedes:<
set list
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
