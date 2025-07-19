
return {
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        config = function () 
            vim.cmd('colorscheme github_dark_default')
            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
        end
    },
}
