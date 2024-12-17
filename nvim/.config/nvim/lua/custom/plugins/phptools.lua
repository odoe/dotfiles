return { -- lazy
  'ccaglak/phptools.nvim',
  keys = {
    { '<leader>lm', '<cmd>PhpMethod<cr>' },
    { '<leader>lc', '<cmd>PhpClass<cr>' },
    { '<leader>ls', '<cmd>PhpScripts<cr>' },
    { '<leader>ln', '<cmd>PhpNamespace<cr>' },
    { '<leader>lg', '<cmd>PhpGetSet<cr>' },
    { '<leader>lf', '<cmd>PhpCreate<cr>' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('phptools').setup {
      ui = false, -- if you have stevearc/dressing.nvim or something similar keep it false or else true
    }
    vim.keymap.set('v', '<leader>lr', ':PhpRefactor<cr>')
  end,
}
