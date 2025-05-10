vim.lsp.enable('omnisharp-mono')
vim.lsp.enable('omnisharp')
vim.lsp.enable('docker_compose_language_service')

-- Set up nvim-cmp.
local cmp = require 'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
            { name = 'path' },
        },
        {
            { name = 'buffer' },
        })
})

require 'conform'.setup({
    formatters_by_ft = {
        python = { "black" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },

})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})
