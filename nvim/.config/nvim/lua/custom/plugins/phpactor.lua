vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('custom-phpactor-build', { clear = true }),
  callback = function(event)
    if event.data.spec.name ~= 'phpactor' or (event.data.kind ~= 'install' and event.data.kind ~= 'update') then return end
    vim.system({ 'composer', 'install', '--no-dev', '--optimize-autoloader' }, { cwd = event.data.path }, function(result)
      if result.code ~= 0 then vim.notify('Phpactor build failed:\n' .. (result.stderr or result.stdout), vim.log.levels.ERROR) end
    end)
  end,
})

vim.pack.add { 'https://github.com/phpactor/phpactor' }

vim.keymap.set('n', '<leader>p', ':PhpactorContextMenu<cr>', { desc = 'Phpactor context menu' })
vim.keymap.set('n', '<leader>pn', ':PhpactorClassNew<cr>')
