return {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '~/notes_vault',
        },
      },
    },
  }
  