
" ####################### BEGIN PLUGIN MANAGEMENT
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

    " auto close parenthesis, brackets, quotes, etc...
    Plug 'jiangmiao/auto-pairs'

    " show indentation in editor
    Plug 'yggdroot/indentline'

    " tree viewer
    Plug 'scrooloose/nerdtree'

    " show changed lines in a file on a git repository
    Plug 'airblade/vim-gitgutter'

    " file finder (requires fzf installed)
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    " status line
    Plug 'itchyny/lightline.vim'

    " multiple cursor
    Plug 'terryma/vim-multiple-cursors'

    " surrounding
    Plug 'tpope/vim-surround'

    " tmux navigation plugin
    Plug 'christoomey/vim-tmux-navigator'

    " markdown
    Plug 'tpope/vim-markdown'

    " autocomplete
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()
" ####################### END PLUGIN MANAGEMENT

" ####################### BEGIN EDITOR SETTINGS 
" setting up line numbers
:set nu

" setting up indentation
if has("autocmd")
    filetype plugin indent on
endif

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" on pressing tab, insert 4 spaces
set expandtab

" setting up default split to right and bottom
set splitbelow
set splitright

" uncomment this line in order to make the backspace key to work as usual
" set backspace=indent,eol,start

" setting up vim to autoreload files when changed
set autoread
" ####################### END EDITOR SETTINGS

" ####################### BEGIN KEYMAP SETTINGS
" Ctrl + o => Open NERDtree viewer as a sidebar 
map <C-o> :NERDTreeToggle<CR>

" ; => Open the file search using fzf
map ; :Files<CR>

" setup the leader key
:let mapleader = ","

" close current window/tab
:nnoremap <leader>q :close<CR>

" save current file
:nnoremap <leader>s :w<CR>

" reload current file
:nnoremap <leader>r :e<CR>

" tab mapping 
:nnoremap <leader>t :tabnew<CR>
:nnoremap <leader>m :tabprevious<CR>
:nnoremap <leader>. :tabnext<CR>
:nnoremap <leader>1 :tabn 1<CR>
:nnoremap <leader>2 :tabn 2<CR>
:nnoremap <leader>3 :tabn 3<CR>
:nnoremap <leader>4 :tabn 4<CR>
:nnoremap <leader>5 :tabn 5<CR>

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" ####################### END KEYMAP SETTINGS

" ####################### BEGIN CUSTOM COMMANDS
" :Em => Enable mouse scroll navigation
:command Em set mouse=a

" :Dm => Disable mouse scroll navigation
:command Dm set mouse=

" :Rs => reload vim configuration
:command Rs so $MYVIMRC

" :WipeReg => clear vim registers
:command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" ####################### END CUSTOM COMMANDS

" ####################### BEGIN PLUGINS SETTINGS 
" scrooloose/nerdtree
let NERDTreeMapOpenInTab='\r'
let NERDTreeShowHidden=1

" nathanaelkane/vim-indent-guides 
colorscheme default

let g:indent_guides_auto_colors = 0 
let g:indent_guides_guide_size = 1 

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=darkgrey ctermbg=252
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=251

" itchyny/lightline
set laststatus=2

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

" yggdroot/indentLine 
let g:indentLine_setConceal = 0
" ####################### END PLUGINS SETTINGS

