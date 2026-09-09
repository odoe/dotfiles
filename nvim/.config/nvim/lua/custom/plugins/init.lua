-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local modules = {
  'snacks',
  'bqf',
  'cloak',
  'fugitive',
  'lualine',
  'dropbar',
  'netrw',
  'neogit',
  'harpoon',
  'tailwindcss',
  'ufo',
  'markdown',
  'obsidian',
  'tiny-inline-diagnostics',
  'conform',
  'none-ls',
  -- 'php',
  -- 'phpactor',
  -- 'phptools',
  'laravel',
  'pretty-ts-errors',
  'claudecode',
  'codecampanion',
  'opencode',
  'octo',
  'copilot',
  -- 'neorg',
  'lsp-lines',
}

for _, module in ipairs(modules) do
  require('custom.plugins.' .. module)
end