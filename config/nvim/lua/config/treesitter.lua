local LANGUAGES = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "rust", "javascript", "typescript", "python", "go" }
require('nvim-treesitter').install(LANGUAGES)
vim.api.nvim_create_autocmd('FileType', {
  pattern = LANGUAGES,
  callback = function() vim.treesitter.start() end,
})
