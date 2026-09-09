vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvimtools/none-ls.nvim',
  'https://github.com/nvimtools/none-ls-extras.nvim',
}

local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.phpcbf,
    null_ls.builtins.formatting.prettierd,
    require 'none-ls.diagnostics.eslint',
  },
}
