vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim', -- required
  'https://github.com/sindrets/diffview.nvim', -- optional - Diff integration
  'https://github.com/nvim-telescope/telescope.nvim', -- optional
  'https://github.com/NeogitOrg/neogit',
}

require('neogit').setup {}
