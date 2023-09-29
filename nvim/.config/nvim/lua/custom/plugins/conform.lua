return {
    {
      "stevearc/conform.nvim",
      dependencies = { "mason.nvim" },
      lazy = true,
      cmd = "ConformInfo",
      opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          fish = { "fish_indent" },
          sh = { "shfmt" },
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
          local ok, formatter = pcall(require, "conform.formatters." .. f)
          opts.formatters[f] = vim.tbl_deep_extend("force", {}, ok and formatter or {}, o)
        end
        require("conform").setup(opts)
      end,
    },
  }