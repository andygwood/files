"" PLUGINS VIA VIM-PLUG
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

"" COLORS
colorscheme elflord
hi CursorLine     guibg=#222222 gui=none
hi LineNr         ctermfg=darkgrey guifg=#666666 guibg=#000000

"" MISC
syntax on
filetype plugin indent on
set laststatus=2
set mouse=a                                                                    "enable mouse

set listchars=nbsp:*,tab:>-,trail:~,extends:>,precedes:<                       "show tabs, spaces etc
set list

set hidden                                                                     "allow buffer move without saving
set number                                                                     "show line numbers

set autoindent                                                                 "Copy indent from current line when starting a new line
set smartindent                                                                "Do smart autoindenting when starting a new line
set expandtab                                                                  "Use the appropriate number of spaces to insert a <Tab>
set tabstop=4                                                                  "Number of spaces that a <Tab> in the file counts for
set shiftwidth=4                                                               "Indent size
set softtabstop=4                                                              "Number of spaces that a <Tab> counts for while performing editing operations
set shiftround                                                                 "Round indent to multiple of 'shiftwidth'

"" goto top of line number
nnoremap <nowait> gg ggzt

"" buffer switching
map <Tab> :bn<cr>
map <S-Tab> :bp<cr>
map <C-w> :bd<cr>

"" natural window splitting
set splitbelow
set splitright

"" NERDTREE
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowCollapsible = '~'
let g:NERDTreeDirArrowExpandable = '+'
nmap <C-a> :NERDTreeToggle<CR>

"" CTRL P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

"" VIM AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"" REMOVE ME?
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
""set runtimepath^=~/.vim/bundle/ctrlp.vim
