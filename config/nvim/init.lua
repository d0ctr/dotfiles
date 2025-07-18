-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require('config.lazy')

vim.cmd("set expandtab")
vim.cmd("set shiftwidth=4")
vim.cmd("set sb")

require('config.keymap')
