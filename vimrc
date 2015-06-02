" Kal's .vimrc file by Jonathan Gutierrez
" Started on May 18th 2015
" Presents the beginning of a long journey

" ==============================
" Hello, my name is Kal and I'm
" an AI.
" ==============================

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a " on OSX press ALT and CLICK
set bs=2    " make backspace behave like normal again :)

" Rebind <Leader> key
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicksave command
noremap <Leader>s :w<CR>  " Quick saves current file
noremap <Leader>S :w!<CR> " Force saves current file


" Quick Quit command
noremap <Leader>q :quit<CR> " Quits current window
noremap <Leader>Q :qa!<CR>  " Quits all windows

" Improved up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk


" Force save files that require Root permission
cmap w!! %!sudo tee > /dev/null %


" Get rid of meh' ex mode!
nnoremap Q <nop>


" Syntastic config (default from website)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" bind Ctrl + <movement> keys to move around the windows, instead of Ctrl+W
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier movement between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" NERDTree map shortcut
map <Leader>l <esc>:NERDTree<CR>
" map sort function to a key
noremap <Leader>f :sort<CR


" better indentation
noremap < <gv
noremap > >gv

" Highlight trailing whitespace in vim on non empty lines, but not while
" typing in insert mode!
highlight ExtraWhitespace ctermbg=red guibg=Brown
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\S\zs\s\+$/
au InsertEnter * match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\S\zs\s\+$/


" Color scheme
set t_Co=256
colorscheme Wombat256mod


" Turn off arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Run Python Code
map <f5> :w <CR>!clear <CR>:!python % <CR> " Use F5 to run it like IDLE

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on
syntax enable

" Showing line numbers and length
set number " show line numbers
set tw=80
set nowrap " don't automatially wrap on load
set fo+=t  " automatically wrap while typing

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABS but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable the dumb swap and backup files vim makes -- they trigger to man
set nobackup
set nowritebackup
set noswapfile

" Emmet only on html and css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


" Pathogen Plugin Manager Setup
" Install plugins into .vim/bundle/plugin-name/ folder
execute pathogen#infect()


" ==================
"  Python IDE Setup
" ==================

" Setting for vim-powerline
set laststatus=2

" Settings for ctrlp
let g:ctrlp_max_heigth = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Setting for python-mode
" stuff
map <Leader>g:call RopeGotoDefinition()<CR>
let ropevim_enable_shortcut = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" Better navigating through omnicoomplete option list
" stackoverflow has more details
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action== 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
     return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python Folding
set foldmethod=indent
nnoremap <expr> <s-cr> foldclosed(line('.')) == -1 ? "\<cr>" : "zA" 
nnoremap <expr> <cr>   foldlevel(line('.'))  ? "za" : "\<cr>" 
