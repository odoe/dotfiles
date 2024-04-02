return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.presenter"] = {
            config = {
              zen_mode = "zen-mode",
            },
          },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
                presentations = "~/presentations",
              },
            },
          },
        },
      })
    end,
    ft = "norg",
    build = ":Neorg sync-parsers",
    dependencies = {
      "luarocks.nvim",
      "nvim-lua/plenary.nvim",
      {
        "folke/zen-mode.nvim",
        config = function()
          require("zen-mode").setup({
            -- your config goes here
            -- or just leave it empty :)
          })
        end,
      },
    },
  },
}
