syntax on
set mouse=a " Scrolling with trackpad in vim
"set relativenumber " Relative numbers in the left side
set number " Show numbers in the left side
set autoread
set expandtab
set ts=4
set shiftwidth=4
set ruler
set cc=110
set hlsearch
set wildmode=longest,list
set incsearch " Move the cursor to the matched string, while typing the search pattern
set showmatch
set cursorline
set hidden " deal with unsaved buffers. ask for saving only when leaving vim
" remap leader key
let mapleader=";"
" copy file name to clipboard
map <leader>cs :let @*=expand("%") . " :" . line(".")<CR>
map <leader>cl :let @*=expand("%:p") . " :" . line(".")<CR>
" open the explorer
map <leader>f :NERDTreeToggle<CR>
" comment if nvim does a good job of sorting it by itself
" let g:python3_host_prog = 'python3'
"
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
filetype off
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')
    " UI related
    " Color scheme gruvbox :
    Plug 'morhetz/gruvbox'
    " Color scheme seoul256
    Plug 'junegunn/seoul256.vim'
    " nerd tree
    Plug 'preservim/nerdtree'
    " Linting
    Plug 'dense-analysis/ale'
    " fzf plugin (fuzzy file finder)
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    " indentation for python
    Plug 'Vimjas/vim-python-pep8-indent'
    " Session handling
    Plug 'tpope/vim-obsession'
    " Surround stuff
    Plug 'tpope/vim-surround'
    " Maximize pane
    Plug 'troydm/zoomwintab.vim'
" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on  " re-enable filetype
" colorscheme
" let base16colorspace=256
" autocmd vimenter * colorscheme gruvbox
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_sign_column = "bg1"
let g:gruvbox_color_column = "bg1"

"True Color Support if it's avaiable in terminal
"if has("termguicolors")
"    set termguicolors
"endif
" fzf run (fuzzy file finder)
set rtp+=/usr/local/opt/fzf
" Try to fix speed issue
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2
" Ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_linters = {'python': ['flake8']}
let g:ale_linters = {'python': ['flake8', 'pyls']}
" use flake8 instead of pyls for linting.
let g:ale_python_flake8_options = '--ignore D100,D101,D102,D107 --max-line-length 120'
let g:ale_python_pyls_config = { 'pyls': { 'plugins': { 'pycodestyle': { 'enabled': 0 } } } }
" auto completion
let g:ale_completion_enabled = 1
let g:ale_cpp_ccls_init_options = {'cache': {'directory': '/tmp/ccls/cache'}}
" File explorer
let g:netrw_banner = 0 " no banner
let g:netrw_liststyle = 3 " tree display style
let g:netrw_browse_split = 4 " open file in previous window
let g:netrw_altv = 1
let g:netrw_winsize = 25 " set size at 25 % of window
" Using floating windows of Neovim to start fzf
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'
  function! FloatingFZF()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }
    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
  endfunction
  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif
