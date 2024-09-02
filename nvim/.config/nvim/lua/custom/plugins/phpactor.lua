return {
  'phpactor/phpactor',
  build = 'composer install --no-dev --optimize-autoloader',
  ft = 'php',
  keys = {
    { '<leader>p', ':PhpactorContextMenu<CR>', desc = 'Phpactor context menu' },
    { '<Leader>pn', ':PhpactorClassNew<CR>' },
  },
}
