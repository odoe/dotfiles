return {
  {
    'stevearc/conform.nvim',
    dependencies = { 'mason.nvim' },
    lazy = true,
    cmd = 'ConformInfo',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        fish = { 'fish_indent' },
        sh = { 'shfmt' },
        php = { 'phpcbf' },
        blade = { 'blade-formatter', 'phpcbf' },
        ['javascript'] = { { 'prettierd', 'prettier' } },
        ['javascriptreact'] = { { 'prettierd', 'prettier' } },
        ['typescript'] = { { 'prettierd', 'prettier' } },
        ['typescriptreact'] = { { 'prettierd', 'prettier' } },
        ['vue'] = { { 'prettierd', 'prettier' } },
        ['css'] = { { 'prettierd', 'prettier' } },
        ['scss'] = { { 'prettierd', 'prettier' } },
        ['less'] = { { 'prettierd', 'prettier' } },
        ['html'] = { { 'prettierd', 'prettier' } },
        ['json'] = { { 'prettierd', 'prettier' } },
        ['jsonc'] = { { 'prettierd', 'prettier' } },
        ['yaml'] = { { 'prettierd', 'prettier' } },
        ['markdown'] = { { 'prettierd', 'prettier' } },
        ['markdown.mdx'] = { { 'prettierd', 'prettier' } },
        ['graphql'] = { { 'prettierd', 'prettier' } },
        ['handlebars'] = { { 'prettierd', 'prettier' } },
        -- ['php'] = { { 'prettierd', 'prettier' } },
        -- ['blade'] = { { 'prettierd', 'prettier' } },
      },
      -- ---@type table<string,table>
      -- formatters = {
      -- -- -- Example of using dprint only when a dprint.json file is present
      -- -- dprint = {
      -- --   condition = function(ctx)
      -- --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
      -- --   end,
      -- -- },
      -- },
    },
    config = function(_, opts)
      opts.formatters = opts.formatters or {}
      for f, o in pairs(opts.formatters) do
        local ok, formatter = pcall(require, 'conform.formatters.' .. f)
        opts.formatters[f] = vim.tbl_deep_extend('force', {}, ok and formatter or {}, o)
      end
      require('conform').setup(opts)
    end,
  },
}
