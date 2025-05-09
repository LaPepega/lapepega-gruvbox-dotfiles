call plug#begin()

Plug 'rust-lang/rust.vim'
Plug 'ellisonleao/gruvbox.nvim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

call plug#end()

lua require'nvim-tree'.setup {}

set background=dark
colorscheme gruvbox

set relativenumber
set cursorline
set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
