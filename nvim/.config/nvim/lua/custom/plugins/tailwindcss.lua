return {
    'NvChad/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup {
            filetypes = { '*' },
            user_default_options = {
                tailwind = true,
            },
            -- all the sub-options of filetypes apply to buftypes
            buftypes = {},
        }
    end,
}
