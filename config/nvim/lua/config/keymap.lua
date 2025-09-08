local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope find files' })

vim.keymap.set('n', '<C-_>', function()
    return vim.v.count == 0
        and '<Plug>(comment_toggle_linewise_current)'
        or '<Plug>(comment_toggle_linewise_count)'
    end, { expr = true })
vim.keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)')

vim.keymap.set('n', '<leader>of', function()
    vim.cmd(':Ex')
end, { desc = 'netrw' })

vim.keymap.set('n', '<leader>nt', function()
    vim.cmd(':sp | terminal')
end, { desc = 'New terminal (via :split)' })

vim.keymap.set('x', '<leader>y', '"+y')
