return {
  'olimorris/codecompanion.nvim',
  opts = {
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = 'DEBUG', -- or "TRACE"
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'ravitemer/codecompanion-history.nvim',
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
