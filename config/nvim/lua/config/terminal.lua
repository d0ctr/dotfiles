-- change behavior of the terminal
--
vim.api.nvim_create_autocmd({ "BufEnter", "TermOpen" }, {
  callback = function(ev)
    if ev['event'] == "TermOpen" then
      vim.cmd('startinsert!')
      vim.api.nvim_win_set_var(0, 'type', 'terminal')
    elseif ev['event'] == "BufEnter" and ev['file'] and string.find(ev['file'], '^term://') then
      vim.cmd('startinsert!')
    end
  end
})

vim.keymap.set('t', '<Esc>', function()
  vim.cmd('stopinsert')
  vim.cmd('wincmd p')

end, { desc = 'Excape terminal' })

vim.keymap.set('n', '<leader>nt', function()
    vim.cmd('botright split | terminal')
end, { desc = 'New terminal (via :split)' })
