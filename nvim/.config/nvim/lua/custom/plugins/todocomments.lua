vim.pack.add { 'https://github.com/folke/todo-comments.nvim' }

require('tiny-inline-diagnostic').setup {{
  event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false }
}}
