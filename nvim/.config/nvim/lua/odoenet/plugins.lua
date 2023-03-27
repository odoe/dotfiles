vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    -- {
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    --     config = function()
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- },
    -- You can alias plugin names
    -- { 'dracula/vim',     as = 'dracula' },
    'folke/tokyonight.nvim',
    { 'catppuccin/nvim', as = 'catppuccin' },
    'challenger-deep-theme/vim',

    -- { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } },
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/playground',
    'theprimeagen/harpoon',
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
            -- {
            --     'glepnir/lspsaga.nvim',
            --     branch = 'main',
            -- },

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
        end,
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
                        ['core.defaults'] = {},   -- Loads default behaviour
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
        run = ':Neorg sync-parsers',
        after = 'nvim-treesitter',
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
    }
}

local opts = {}

require("lazy").setup(plugins, opts)
