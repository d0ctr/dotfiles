return {

    { 'neovim/nvim-lspconfig' },
    -- https://github.com/mason-org/mason-lspconfig.nvim
    {
        'mason-org/mason-lspconfig.nvim',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'mason-org/mason.nvim', opts = {} },
        },
        opts = {}
    },
    -- https://github.com/hrsh7th/nvim-cmp
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        opts = function()
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
            local cmp = require('cmp')

            local sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
            }, {
                { name = "buffer" },
            })
            table.insert(sources, { name = 'snippets' } )

            return {
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end
                },
                sources = sources,
            }
        end,
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            {
                "garymjr/nvim-snippets",
                opts = {
                    friendly_snippets = true,
                },
                dependencies = { "rafamadriz/friendly-snippets" },
            },
            -- Maybe? nonnative snippets enginges
            -- { 'hrsh7th/cmp-vsnip' },
            -- { 'hrsh7th/vim-vsnip' },
        },
    },
}
