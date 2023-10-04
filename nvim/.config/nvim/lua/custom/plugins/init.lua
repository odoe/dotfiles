-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  { 'nvim-treesitter/nvim-treesitter-context' },
  { 'voldikss/vim-floaterm' },
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup {
        color_icons = true,
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true,
      }
    end,
  },
  { 'mbbill/undotree' },
  { 'windwp/nvim-autopairs' },
  { 'editorconfig/editorconfig-vim' },
  { 'akinsho/git-conflict.nvim',    version = '*', config = true },
}
