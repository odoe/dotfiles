vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/ccaglak/phptools.nvim',
}

require('phptools').setup {
  ui = { enable = false }, -- Keep disabled when another UI provider handles selections.
}

vim.keymap.set('n', '<leader>lm', '<cmd>PhpMethod<cr>')
vim.keymap.set('n', '<leader>lc', '<cmd>PhpClass<cr>')
vim.keymap.set('n', '<leader>ls', '<cmd>PhpScripts<cr>')
vim.keymap.set('n', '<leader>ln', '<cmd>PhpNamespace<cr>')
vim.keymap.set('n', '<leader>lg', '<cmd>PhpGetSet<cr>')
vim.keymap.set('n', '<leader>lf', '<cmd>PhpCreate<cr>')
vim.keymap.set('v', '<leader>lr', ':PhpRefactor<cr>')
