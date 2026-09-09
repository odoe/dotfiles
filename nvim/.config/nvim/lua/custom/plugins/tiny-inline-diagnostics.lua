vim.pack.add { 'https://github.com/rachartier/tiny-inline-diagnostic.nvim' }

require('tiny-inline-diagnostic').setup {
  signs = {
    left = '',
    right = '',
    diag = '●',
    arrow = '    ',
    up_arrow = '    ',
    vertical = ' │',
    vertical_end = ' └',
  },
  blend = {
    factor = 0.22,
  },
}
