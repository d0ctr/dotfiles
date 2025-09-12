return {
    -- https://github.com/ofirgall/open.nvim
    { 'ofirgall/open.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    -- https://github.com/windwp/nvim-autopairs
    { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },
    -- https://github.com/numToStr/Comment.nvim
    { 'numToStr/Comment.nvim', config = true },
    -- https://github.com/ray-x/lsp_signature.nvim
    { 'ray-x/lsp_signature.nvim', event = 'InsertEnter', config = true },
    -- https://github.com/NMAC427/guess-indent.nvim
    { 'nmac427/guess-indent.nvim', config = true },
    -- https://github.com/Pocco81/auto-save.nvim
    { 'Pocco81/auto-save.nvim' },
    -- https://github.com/nvim-telescope/telescope.nvim
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
    -- https://github.com/nvim-treesitter/nvim-treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('config.treesitter')
        end
    },
    -- https://github.com/ThePrimeagen/vim-be-good
    { 'ThePrimeagen/vim-be-good' },
    -- https://github.com/tzachar/local-highlight.nvim
    {
        'tzachar/local-highlight.nvim',
        opts = {
            animate = { enabled = false },
            file_types = {},
            disable_file_types = { 'md' },
        },
    },
    -- https://github.com/nvim-lualine/lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
            },
            sections = {
                lualine_b = {},
                lualine_x = {'filetype'}
            },
        },
    },
}

