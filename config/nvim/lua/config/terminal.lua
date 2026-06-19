-- change behavior of the terminal
--

local T_WIN_ID = 'terminalwinid'
local T_WIN_REQ = 'terminalwinreq'
vim.api.nvim_set_var(T_WIN_ID, nil)
vim.api.nvim_set_var(T_WIN_REQ, false)

vim.api.nvim_create_autocmd({ "BufEnter", "TermOpen" }, {
  callback = function(ev)
    if ev['event'] == "TermOpen" then
      if vim.api.nvim_get_var(T_WIN_REQ) then
        vim.cmd('startinsert!')
        vim.api.nvim_win_set_var(0, 'type', 'terminal')
        vim.api.nvim_set_var(T_WIN_ID, vim.fn.win_getid())
        vim.api.nvim_set_var(T_WIN_REQ, false)
      else
        vim.api.nvim_win_set_var(0, 'type', 'noterminal')
      end
    elseif ev['event'] == "BufEnter" and ev['file'] and string.find(ev['file'], '^term://') and vim.api.nvim_win_get_var(0, 'type') == 'terminal' then
      vim.cmd('startinsert!')
    end
  end
})

vim.keymap.set('t', '<Esc>', function()
  if vim.api.nvim_win_get_var(0, 'type') == 'terminal' then
    -- vim.cmd('stopinsert')
    -- vim.api.nvim_cmd({ cmd = 'wincmd', args = { 'p' } }, {})
    return '<C-\\><C-n><C-w>p'
  else
    return '<Esc>'
  end

end, { desc = 'Escape terminal', expr = true })

local new_terminal = function ()
      local height = vim.api.nvim_win_get_height(0)
      height = math.min(20, math.floor(height * 0.2))
      vim.api.nvim_set_var(T_WIN_REQ, true)
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
