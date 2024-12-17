return {
  {
    'nvimtools/none-ls.nvim',
    optional = true,
    opts = function(_, opts)
      local null_ls = require("null-ls")
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.phpcbf,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.stimulus_ls,
          null_ls.builtins.diagnostics.eslint,
        },
      }
    end,
  },
}
