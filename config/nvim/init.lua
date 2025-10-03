-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require('config.lazy')

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.sb = true
vim.opt.number = true
vim.opt.relativenumber = true

require('config.keymap')
require('config.terminal')
