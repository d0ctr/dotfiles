local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>rf', builtin.buffers, { desc = 'Telescope recent files' })
vim.keymap.set('n', '<leader>cd', function() 
    vim.cmd('cd %:p:h')
end, { desc = 'cd to current file\'s directory' })

vim.keymap.set('n', '<leader>of', function()
    vim.cmd(':Ex')
end, { desc = 'netrw' })

vim.keymap.set('', '<leader>y', '"+y', { desc = 'Copy to system clipboard [+]' })
vim.keymap.set('', '<leader>p', '"+p', { desc = 'Paste from system clipboard [+]' })

vim.keymap.set('n', '<leader>qa', function()
    vim.cmd(':confirm quitall')
end, { desc = 'Close all windows' })
