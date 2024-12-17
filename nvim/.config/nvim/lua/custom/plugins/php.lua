return {
    {
      -- Set Laravel Pint as the default PHP formatter with PHP CS Fixer as a fall back.
      "stevearc/conform.nvim",
      optional = true,
      opts = {
        formatters_by_ft = {
          php = { "pint", "php_cs_fixer", stop_after_first = true },
        },
      },
    },
    {
      -- Remove phpcs linter.
      "mfussenegger/nvim-lint",
      optional = true,
      opts = {
        linters_by_ft = {
          php = {},
        },
      },
    },
    {
        -- Add neotest-pest plugin for running PHP tests.
        -- A package is also available for PHPUnit if needed.
        "nvim-neotest/neotest",
        dependencies = { "V13Axel/neotest-pest" },
        opts = { adapters = { "neotest-pest" } },
    },
    {
        -- Add a Treesitter parser for Laravel Blade to provide Blade syntax highlighting.
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          vim.list_extend(opts.ensure_installed, {
            "blade",
            "php_only",
          })
        end,
        config = function(_, opts)
          vim.filetype.add({
            pattern = {
              [".*%.blade%.php"] = "blade",
            },
          })
    
          require("nvim-treesitter.configs").setup(opts)
          local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
          parser_config.blade = {
            install_info = {
              url = "https://github.com/EmranMR/tree-sitter-blade",
              files = { "src/parser.c" },
              branch = "main",
            },
            filetype = "blade",
          }
        end,
    },
    {
        -- Add the blade-nav.nvim plugin which provides Goto File capabilities
        -- for Blade files.
        "ricardoramirezr/blade-nav.nvim",
        dependencies = {
          "hrsh7th/nvim-cmp",
        },
        ft = { "blade", "php" },
    },
  }
  