vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/ravitemer/codecompanion-history.nvim',
  'https://github.com/olimorris/codecompanion.nvim',
}

require('codecompanion').setup {
  opts = {
    log_level = 'DEBUG', -- or "TRACE"
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>aa', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'CodeCompanion Chat' })
vim.keymap.set({ 'n', 'x', 'v' }, '<leader>aq', ':CodeCompanion', { desc = 'CodeCompanion inline chat' })
vim.keymap.set({ 'n', 'v' }, '<leader>AA', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion actions' })
vim.keymap.set({ 'n', 'v' }, '<leader>an', '<cmd>CodeCompanionChat<cr>', { desc = 'CodeCompanion new chat' })
vim.keymap.set({ 'n', 'v' }, '<leader>av', '<cmd>CodeCompanionChat Add<cr>', { desc = 'send visual selection to chat' })
