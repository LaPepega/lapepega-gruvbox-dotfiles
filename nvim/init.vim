call plug#begin()

Plug 'rust-lang/rust.vim'
Plug 'ellisonleao/gruvbox.nvim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

lua require'nvim-tree'.setup {}

set background=dark
colorscheme gruvbox

let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:airline#extensions#branch#enabled=1

set relativenumber
set cursorline
set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set wildignorecase
set ignorecase
