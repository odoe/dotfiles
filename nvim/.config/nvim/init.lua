vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.keymaps')
require('config.options')

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require('odoenet.config.telescope')
        end
    },

    -- {
    --     'rose-pine/neovim',
    --     name = 'rose-pine',
    --     config = function()
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- },
    { 'Mofiqul/dracula.nvim',    name = 'dracula' },
    'folke/tokyonight.nvim',
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        config = function()
            vim.cmd('colorscheme catppuccin')
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    },
    'challenger-deep-theme/vim',
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-neorg/neorg'
        },
        config = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
            require('odoenet.config.treesitter')
        end,
    },
    -- { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } },
    -- 'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/playground',
    {
        'theprimeagen/harpoon',
        config = function()
            require('odoenet.config.harpoon')
        end
    },
    'mbbill/undotree',

    'tpope/vim-fugitive',
    'voldikss/vim-floaterm',
    'tpope/vim-commentary',

    -- {
    --     'nvim-tree/nvim-tree.lua',
    --     dependencies = {
    --         'nvim-tree/nvim-web-devicons', -- optional, for file icons
    --     },
    --     tag = 'nightly' -- optional, updated every week. (see issue #1193)
    -- }

    'nvim-tree/nvim-web-devicons', -- optional, for file icons

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
            {
                'j-hui/fidget.nvim',
                event = 'BufReadPre',
                config = function()
                    require('fidget').setup {}
                end,
            },
        }
    },

    {
        'glepnir/lspsaga.nvim',
        branch = 'main',
        config = function()
            require('lspsaga').setup({})
            require('odoenet.config.lspsaga')
        end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" }
        }
    },
    -- 'folke/zen-mode.nvim',
    'editorconfig/editorconfig-vim',
    {
        'Pocco81/true-zen.nvim',
        config = function()
            require('true-zen').setup {
                -- your config goes here
                -- or just leave it empty :)
            }
        end,
    },
    -- Rust 'simrat39/rust-tools.nvim',

    {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    },

    'p00f/nvim-ts-rainbow',

    {
        'nvim-neorg/neorg',
        config = function()
            require('neorg').setup {
                load = {
                    ['core.defaults'] = {},       -- Loads default behaviour
                    ['core.norg.concealer'] = {}, -- Adds pretty icons to your documents
                    ['core.presenter'] = {
                        config = {
                            zen_mode = 'zen-mode'
                        }
                    },
                    ['core.norg.dirman'] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = '~/notes',
                                presentations = '~/presentations'
                            },
                        },
                    },
                },
            }
        end,
        ft = 'norg',
        build = ':Neorg sync-parsers',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'folke/zen-mode.nvim',
                config = function()
                    require('zen-mode').setup {
                        -- your config goes here
                        -- or just leave it empty :)
                    }
                end,
            }
        },
    },

    { import = 'odoenet.plugins' },
}

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

require('lazy').setup(plugins, {})

require 'nvim-web-devicons'.setup {
    color_icons = true,
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true,
}
