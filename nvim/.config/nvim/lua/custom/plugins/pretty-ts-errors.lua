-- pretty-ts-errors.lua
return {
  {
    'youyoumu/pretty-ts-errors.nvim',
    build = 'npm install -g pretty-ts-errors-markdown',
    opts = {},
    config = function(_, opts)
      -- Show error under cursor
      vim.keymap.set('n', '<leader>te', function()
        require('pretty-ts-errors').show_formatted_error()
      end, { desc = 'Show TS error' })

      -- Show all errors in file
      vim.keymap.set('n', '<leader>tE', function()
        require('pretty-ts-errors').open_all_errors()
      end, { desc = 'Show all TS errors' })

      -- Toggle auto-display
      vim.keymap.set('n', '<leader>tt', function()
        require('pretty-ts-errors').toggle_auto_open()
      end, { desc = 'Toggle TS error auto-display' })
    end,
  },
}
