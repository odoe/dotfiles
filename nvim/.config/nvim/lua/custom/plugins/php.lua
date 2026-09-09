vim.pack.add {
  'https://github.com/mfussenegger/nvim-lint',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-neotest/neotest',
  'https://github.com/V13Axel/neotest-pest',
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  'https://github.com/hrsh7th/nvim-cmp',
  'https://github.com/ricardoramirezr/blade-nav.nvim',
}

-- Disable PHP linting; formatting is configured in custom.plugins.conform.
require('lint').linters_by_ft.php = {}

require('neotest').setup {
  adapters = {
    require('neotest-pest') {},
  },
}

vim.filetype.add {
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
}

require('nvim-treesitter').install { 'blade', 'php_only' }
  