-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require('config.lazy')

-- configure indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
-- splitting after the open window
vim.opt.splitbelow = true
vim.opt.splitright = true
-- set line ruler
vim.opt.number = true
vim.opt.relativenumber = true
-- set title
vim.opt.title = true
function _G.title()
    local pwd = vim.fn.getcwd()
    local pwd_basename = vim.fn.fnamemodify(pwd, ':t')
    local bufname = vim.fn.bufname('%')

    -- Check if current buffer is netrw
    if vim.bo.buftype == 'terminal' then
        return string.format("%s $ — nvim", pwd_basename)
    else
        local file_name = vim.fn.fnamemodify(bufname, ':p:.')
        if file_name == '' then
            file_name = vim.fn.fnamemodify(bufname, ':h:t')
        end

        if vim.bo.filetype == 'netrw' then
            return string.format("%s < [%s] — nvim", pwd_basename, file_name)
        else
            return string.format("%s < %s — nvim", pwd_basename, file_name)
        end
    end
end
vim.opt.titlestring = "%{%v:lua.title()%}"

require('config.keymap')
require('config.terminal')
