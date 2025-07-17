return {
  {
    'stevearc/conform.nvim',
    -- dependencies = { 'mason.nvim' },
    lazy = true,
    cmd = 'ConformInfo',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        -- fish = { 'fish_indent' },
        sh = { 'shfmt' },
        php = { 'phpcbf' },
        blade = { 'blade-formatter', 'phpcbf', stop_after_first = true },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        vue = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        scss = { 'prettierd', 'prettier', stop_after_first = true },
        less = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        jsonc = { 'prettierd', 'prettier', stop_after_first = true },
        yaml = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        ['markdown.mdx'] = { 'prettierd', 'prettier', stop_after_first = true },
        graphql = { 'prettierd', 'prettier', stop_after_first = true },
        handlebars = { 'prettierd', 'prettier', stop_after_first = true },
        -- php = { 'prettierd', 'prettier', stop_after_first = true } ,
        -- blade = { 'prettierd', 'prettier', stop_after_first = true } ,
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
