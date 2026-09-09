-- pretty-ts-errors.lua
vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('custom-pretty-ts-errors-build', { clear = true }),
  callback = function(event)
    if event.data.spec.name ~= 'pretty-ts-errors.nvim' or (event.data.kind ~= 'install' and event.data.kind ~= 'update') then return end
    vim.system({ 'npm', 'install', '-g', 'pretty-ts-errors-markdown' }, {}, function(result)
      if result.code ~= 0 then vim.notify('pretty-ts-errors build failed:\n' .. (result.stderr or result.stdout), vim.log.levels.ERROR) end
    end)
  end,
})

vim.pack.add { 'https://github.com/youyoumu/pretty-ts-errors.nvim' }

vim.keymap.set('n', '<leader>te', function() require('pretty-ts-errors').show_formatted_error() end, { desc = 'Show TS error' })
vim.keymap.set('n', '<leader>tE', function() require('pretty-ts-errors').open_all_errors() end, { desc = 'Show all TS errors' })
vim.keymap.set('n', '<leader>tt', function() require('pretty-ts-errors').toggle_auto_open() end, { desc = 'Toggle TS error auto-display' })
