call plug#begin("~/.config/nvim/plugins")

Plug 'rust-lang/rust.vim'
Plug 'ellisonleao/gruvbox.nvim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'ray-x/lsp_signature.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/trouble.nvim'
Plug 'stevearc/conform.nvim'
"Plug 'jmcantrell/vim-virtualenv'

Plug 'mason-org/mason.nvim'
"Plug 'linux-cultist/venv-selector.nvim'

Plug 'm4xshen/autoclose.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'hiphish/rainbow-delimiters.nvim'

Plug 'rbong/vim-flog'

call plug#end()

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
set pumheight=10

lua require "lsp_signature".setup()
lua require 'nvim-tree'.setup()
lua require 'trouble'.setup()
lua require 'dapui'.setup()
lua require 'mason'.setup()
lua require 'autoclose'.setup()
lua require 'ibl'.setup()
lua require 'rainbow-delimiters.setup'.setup()

lua require 'lspconfig'.rust_analyzer.setup{}
lua require 'lspconfig'.vimls.setup{}
lua require 'lspconfig'.pyright.setup{}
lua require 'lspconfig'.clangd.setup{}
lua require 'lspconfig'.lua_ls.setup{}
lua require 'lspconfig'.dockerls.setup{}
lua require 'lspconfig'.ts_ls.setup{}
lua require 'lspconfig'.html.setup{}
lua require 'lspconfig'.cssls.setup{}
lua require 'lspconfig'.bashls.setup{}
lua require 'lspconfig'.tailwindcss.setup{}


"lua require 'lspconfig'.jsonls.setup{}
"lua require 'venv-selector'.setup()

