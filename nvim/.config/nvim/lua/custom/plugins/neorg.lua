vim.pack.add {
  'https://github.com/vhyrro/luarocks.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-neorg/lua-utils.nvim',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/pysan3/pathlib.nvim',
  'https://github.com/folke/zen-mode.nvim',
  'https://github.com/nvim-neorg/neorg',
}

local luarocks = require 'luarocks-nvim'
local luarocks_build = require 'luarocks-nvim.build'
luarocks.setup {
  rocks = {
    'tree-sitter-norg',
    'tree-sitter-norg-meta',
  },
}
if not luarocks_build.is_prepared() then luarocks_build.build() end

require('zen-mode').setup {}
require('neorg').setup {
  load = {
    ['core.defaults'] = {}, -- Loads default behaviour
    ['core.concealer'] = {}, -- Adds pretty icons to your documents
    ['core.presenter'] = {
      config = {
        zen_mode = 'zen-mode',
      },
    },
    ['core.dirman'] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = '~/notes',
          presentations = '~/presentations',
        },
      },
    },
  },
}
