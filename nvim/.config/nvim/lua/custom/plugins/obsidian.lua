vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  { src = 'https://github.com/obsidian-nvim/obsidian.nvim', version = vim.version.range '*' },
}

---@module 'obsidian'
---@type obsidian.config
local opts = {
  legacy_commands = false,
  workspaces = {
    {
      name = 'personal',
      path = '~/notes_vault',
    },
  },
  ui = {
    enable = false, -- set to false to disable all additional syntax features
  },
}

require('obsidian').setup(opts)
