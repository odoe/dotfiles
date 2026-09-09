vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/pwntester/octo.nvim',
}

require('octo').setup {
  picker = 'telescope',
  enable_builtin = true,
}

vim.keymap.set('n', '<leader>oi', '<cmd>Octo issue list<cr>', { desc = 'List GitHub Issues' })
vim.keymap.set('n', '<leader>op', '<cmd>Octo pr list<cr>', { desc = 'List GitHub PullRequests' })
vim.keymap.set('n', '<leader>od', '<cmd>Octo discussion list<cr>', { desc = 'List GitHub Discussions' })
vim.keymap.set('n', '<leader>on', '<cmd>Octo notification list<cr>', { desc = 'List GitHub Notifications' })
vim.keymap.set('n', '<leader>os', function()
  require('octo.utils').create_base_search_command { include_current_repo = true }
end, { desc = 'Search GitHub' })
