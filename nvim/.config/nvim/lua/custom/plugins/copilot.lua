local group = vim.api.nvim_create_augroup('custom-copilot-chat-build', { clear = true })
vim.api.nvim_create_autocmd('PackChanged', {
  group = group,
  callback = function(event)
    if event.data.spec.name ~= 'CopilotChat.nvim' or (event.data.kind ~= 'install' and event.data.kind ~= 'update') then return end
    vim.system({ 'make', 'tiktoken' }, { cwd = event.data.path }, function(result)
      if result.code ~= 0 then vim.notify('CopilotChat build failed:\n' .. (result.stderr or result.stdout), vim.log.levels.ERROR) end
    end)
  end,
})

  -- {
  --   'github/copilot.vim',
  --   cmd = 'Copilot',
  --   event = 'InsertEnter',
  -- },
  -- {
  --   'zbirenbaum/copilot.lua',
  --   cmd = 'Copilot',
  --   event = 'InsertEnter',
  --   config = function()
  --     require('copilot').setup {
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     }
  --   end,
  -- },
  -- {
  --   'zbirenbaum/copilot-cmp',
  --   config = function()
  --     require('copilot_cmp').setup()
  --   end,
  -- },

vim.pack.add {
  'https://github.com/copilotlsp-nvim/copilot-lsp',
  'https://github.com/zbirenbaum/copilot.lua',
  'https://github.com/nvim-lua/plenary.nvim',
  { src = 'https://github.com/CopilotC-Nvim/CopilotChat.nvim', version = 'main' },
}

vim.g.copilot_nes_debounce = 500

require('copilot').setup {
  nes = {
    enabled = true,
    keymap = {
      accept_and_goto = '<leader>p',
      accept = false,
      dismiss = '<Esc>',
    },
  },
}

require('CopilotChat').setup {}
