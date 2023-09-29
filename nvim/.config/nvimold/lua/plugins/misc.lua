return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "voldikss/vim-floaterm" },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        color_icons = true,
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true,
      })
    end,
  },
  { "mbbill/undotree" },
  {
    "theprimeagen/harpoon",
    config = function()
      require("config.harpoon")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      config = function()
        require("config.snippets")
      end,
    },
  },
  { "editorconfig/editorconfig-vim" },
  -- { "p00f/nvim-ts-rainbow" },
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-neorg/neorg",
    },
    config = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
      require("config.treesitter")
    end,
  },
  {'akinsho/git-conflict.nvim', version = "*", config = true}
}
