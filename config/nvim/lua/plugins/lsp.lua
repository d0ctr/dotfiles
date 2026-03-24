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
    -- most of it is copied from https://github.com/LazyVim/LazyVim/blob/6055e59613b406f9c4312c95e56f604fb839a97e/lua/lazyvim/plugins/extras/coding/nvim-cmp.lua
    {
        'hrsh7th/nvim-cmp',
        version = false,
        event = "InsertEnter",
        opts = function()
            vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
            local cmp = require('cmp')
            local defaults = require("cmp.config.default")()
            local auto_select = true

            local sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
            }, {
                { name = "buffer" },
            })

            return {
                auto_brackets = {}, -- configure any filetype to auto add brackets
                completion = {
                    completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
                },
                preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = auto_select }),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<C-CR>"] = function(fallback)
                        cmp.abort()
                        fallback()
                    end,
                }),
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
