-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })

vim.keymap.set('n', '<C-_>', function()
    return vim.v.count == 0
        and '<Plug>(comment_toggle_linewise_current)'
        or '<Plug>(comment_toggle_linewise_count)'
    end, { expr = true })
vim.keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)')

vim.keymap.set('n', '<leader>of', function()
    vim.cmd(':Ex')
end)
