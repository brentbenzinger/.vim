" Reload .vimrc and :PlugInstall to install plugins.
" :PlugUpdate will change package settings
" :PlugClean! will remove plugins missing from call plug()
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'joshdick/onedark.vim'
    Plug 'mattn/emmet-vim'
    " Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    " Plug 'sheerun/vim-polyglot'
    " Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-scripts/dbext.vim'
    Plug 'junegunn/vim-plug'
call plug#end()


" Set plugin variables "
colorscheme onedark
" Emmet leader key WOW finding a leader key that works is such a pain
let g:user_emmet_expandabbr_key = '<C-@>'
let g:user_emmet_leader_key='<F12>'
" NERDTree
noremap <F6> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
" vim-polyglot
let g:polyglot_disabled = ['markdown', 'php']
" this is from StanAngeloff/php.vim, which is coming form vim-polyglot
let php_sql_query = 1

" set cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" set move line behavior
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==
inoremap <C-k> <Esc>:m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" Leader key mapped to space
let mapleader = "\<Space>"

" some vim basics
set number
set showcmd
set hlsearch
set nowrap
set splitbelow
set autoindent
set nocompatible " No compatible basically says don't bother pretending to be vi
set timeoutlen=1000 ttimeoutlen=50 " fix the annoying delay on esc
set ignorecase " prefix searches with \C to set them as case-sensitive
" set smartcase " search with no capitals is case insensitive, with caps is case sensitive
syntax enable

" open VIMRC
noremap <F2> :tabnew $MYVIMRC<CR>
" toggle wordwrap
noremap <F3> :setlocal wrap!<CR>
" copy current buffer path to clipboard
noremap <silent> <F4> :let @+=expand("%:p")<CR>
" delete trailing spaces and fix indentation
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>gg=G<C-o><C-o>

nnoremap <leader>sv :source $MYVIMRC<CR>

" if file type is asp, set syntax to php
augroup asp_php
  autocmd!
  autocmd BufNewFile,BufRead *.asp set syntax=php
augroup END

" set tab behavior
set tabstop=2
set shiftwidth=2
set expandtab
set shiftround " when you tab and >> and <C-T> it will automatically round out to 4
set formatoptions-=cro " format options: don't automatically insert comments on i_o or i_O
set matchtime=1 " that moment where the {} match each other is a lot shorter, less annoying, read more-  :h 'sm
" let loaded_match_paren=1

" leader mappings
nnoremap <leader>d ^d$a
noremap <silent> <leader>n :noh<CR>
noremap <leader>r :setlocal relativenumber!<CR>
noremap <leader>" :s/'/"/g<CR>:noh<CR><C-O>
noremap <leader>' :s/"/'/g<CR>:noh<CR><C-O>
nnoremap <leader>[ f[lviw<esc>a'<esc>bi'<esc>lel


" this is for moving the cursor after expanding abbreviations
function! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc
" :autocmd FileType javascript iabbrev <silent> cl; console.log();<left><left><C-R>=Eatchar('\s')<CR>
iabbrev <silent> cl; console.log();<left><left><C-R>=Eatchar('\s')<CR>
iabbrev <silent> hr; echo "<hr>";<C-R>=Eatchar('\s')<CR>
iabbrev <silent> pre; echo "<pre>";<C-R>=Eatchar('\s')<CR>
iabbrev <silent> br; echo "<br>";<C-R>=Eatchar('\s')<CR>
iabbrev <silent> dd; ddump();<left><left><C-R>=Eatchar('\s')<CR>

nnoremap U :echo "TURN OFF CAPS LOCK"<CR>
nnoremap KJ :echo "TURN OFF CAPS LOCK"<CR>
nnoremap K :echo "TURN OFF CAPS LOCK"<CR>



" I'm going to try mouse resizing
set mouse=n
set ttymouse=xterm2
set encoding=UTF-8

" wrap words in quotes
nnoremap "" viw<esc>a"<esc>bi"<esc>lel
nnoremap "' viw<esc>a'<esc>bi'<esc>lel

" copy to clipboard
set clipboard=unnamedplus

" trying out a new binding recommendation, H and L will jump to end line/start
nnoremap L $
nnoremap H ^
" inoremap <C-d> <Del>
" inoremap <BS> <nop>
" inoremap <C-b> <Left>
" inoremap <C-f> <Right>
" nnoremap L :echo "Try your new keyboard bindings"<CR>
" nnoremap H :echo "Try your new keyboard bindings"<CR>
inoremap <C-d> <nop>
inoremap <C-h> <nop>
inoremap <C-b> <nop>
inoremap <C-f> <nop>
 
" let g:dbext_default_profile_live_export = 'type=MYSQL:user=root:passwd=`cat ./dbext_pw.txt`:dbname=publicschoolworks'
let g:dbext_default_buffer_lines = 50

set path+=/php/includes
set path+=/php/smarty/templates
set path+=/var/www/Prosum
set path+=/var/www/Prosum/JSIncludes

let g:airline_powerline_fonts = 1

augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
