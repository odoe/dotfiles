vim.pack.add { 'https://github.com/NvChad/nvim-colorizer.lua' }

require('colorizer').setup {
    filetypes = { '*' },
    user_default_options = {
        tailwind = true,
    },
    -- all the sub-options of filetypes apply to buftypes
    buftypes = {},
}
