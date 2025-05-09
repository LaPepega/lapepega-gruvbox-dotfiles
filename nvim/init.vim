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

"Plug 'jmcantrell/vim-virtualenv'

Plug 'mason-org/mason.nvim'
"Plug 'linux-cultist/venv-selector.nvim'

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

lua require "lsp_signature".setup({})
lua require 'nvim-tree'.setup({})
lua require 'trouble'.setup({})
lua require 'dapui'.setup()
lua require 'mason'.setup()
"lua require 'venv-selector'.setup()


lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'
  
  vim.lsp.enable('pyright')
  vim.lsp.enable('vimls')

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'path' }, 
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
EOF
