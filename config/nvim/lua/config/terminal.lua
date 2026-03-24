-- change behavior of the terminal
--

local T_WIN_ID = 'terminalwinid'
vim.api.nvim_set_var(T_WIN_ID, nil)
vim.api.nvim_create_autocmd({ "BufEnter", "TermOpen" }, {
  callback = function(ev)
    if ev['event'] == "TermOpen" then
      vim.cmd('startinsert!')
      vim.api.nvim_win_set_var(0, 'type', 'terminal')
      vim.api.nvim_set_var(T_WIN_ID, vim.fn.win_getid())
    elseif ev['event'] == "BufEnter" and ev['file'] and string.find(ev['file'], '^term://') then
      vim.cmd('startinsert!')
    end
  end
})

vim.keymap.set('t', '<Esc>', function()
  vim.cmd('stopinsert')
  vim.cmd('wincmd p')

end, { desc = 'Escape terminal' })

local new_terminal = function ()
      local height = vim.api.nvim_win_get_height(0)
      height = math.min(20, math.floor(height * 0.2))
      vim.cmd('botright '.. height ..'split | terminal')
end

vim.keymap.set('n', '<leader>ot', function()
    local termid = vim.api.nvim_get_var(T_WIN_ID)
    if termid == nil or not vim.api.nvim_win_is_valid(termid) then
        new_terminal()
    else
        vim.fn.win_gotoid(termid)
    end
end, { desc = 'Open existing or create a new terminal (via :split)' })

vim.keymap.set('n', '<leader>nt', new_terminal)
