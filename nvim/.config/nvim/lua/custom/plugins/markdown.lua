vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('custom-markdown-preview-build', { clear = true }),
  callback = function(event)
    if event.data.spec.name ~= 'markdown-preview.nvim' or (event.data.kind ~= 'install' and event.data.kind ~= 'update') then return end
    vim.system({ 'yarn', 'install' }, { cwd = event.data.path .. '/app' }, function(result)
      if result.code ~= 0 then vim.notify('markdown-preview build failed:\n' .. (result.stderr or result.stdout), vim.log.levels.ERROR) end
    end)
  end,
})

vim.g.mkdp_filetypes = { 'markdown' }

vim.pack.add {
  'https://github.com/saghen/blink.cmp',
  'https://github.com/OXY2DEV/markview.nvim',
  'https://github.com/iamcco/markdown-preview.nvim',
}
