return {
  'olimorris/codecompanion.nvim',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      '<leader>aa',
      mode = { 'n', 'v' },
      '<cmd>CodeCompanionChat Toggle<cr>',
      desc = 'CodeCompanion Chat',
    },
    {
      '<leader>aq',
      ':CodeCompanion',
      mode = { 'n', 'x', 'v' },
      desc = 'CodeCompanion inline chat',
    },
    {
      '<leader>AA',
      '<cmd>CodeCompanionActions<cr>',
      mode = { 'n', 'v' },
      desc = 'CodeCompanion actions',
    },
    {
      '<leader>an',
      '<cmd>CodeCompanionChat<cr>',
      mode = { 'n', 'v' },
      desc = 'CodeCompanion new chat',
    },
    {
      '<leader>av',
      '<cmd>CodeCompanionChat Add<cr>',
      mode = { 'n', 'v' },
      desc = 'send visual selection to chat',
    },
  },
}
