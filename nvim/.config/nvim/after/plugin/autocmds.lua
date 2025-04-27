vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.cmd [[command! OR lua lsp_organize_imports()]]
    local bufopts = { noremap = true, silent = true, buffer = ev.buf }
    vim.keymap.set('n', 'gO', lsp_organize_imports, { noremap = true, silent = true, buffer = ev.buf, desc = 'Organize Imports' })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown' },
  callback = function()
    vim.opt.wrap = true
    vim.opt.textwidth = 80
  end,
})
