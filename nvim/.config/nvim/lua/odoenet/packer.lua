-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    -- You can alias plugin names
    use { 'dracula/vim', as = 'dracula' }
    use('folke/tokyonight.nvim')
    use { "catppuccin/nvim", as = "catppuccin" }
    use('challenger-deep-theme/vim')

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-context')
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')

    use('tpope/vim-fugitive')
    use('voldikss/vim-floaterm')
    use('tpope/vim-commentary')

    -- use {
    --     'nvim-tree/nvim-tree.lua',
    --     requires = {
    --         'nvim-tree/nvim-web-devicons', -- optional, for file icons
    --     },
    --     tag = 'nightly' -- optional, updated every week. (see issue #1193)
    -- }

    use("nvim-tree/nvim-web-devicons") -- optional, for file icons


    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- {
            --     "glepnir/lspsaga.nvim",
            --     branch = "main",
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
                "j-hui/fidget.nvim",
                event = "BufReadPre",
                config = function()
                    require("fidget").setup {}
                end,
            },
        }
    }

    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require('lspsaga').setup({})
        end,
    })
    -- use('folke/zen-mode.nvim')
    use('editorconfig/editorconfig-vim')
    use({
        "Pocco81/true-zen.nvim",
        config = function()
            require("true-zen").setup {
                -- your config goes here
                -- or just leave it empty :)
            }
        end,
    })
    -- Rust use('simrat39/rust-tools.nvim')

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use('p00f/nvim-ts-rainbow')

    use {
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.presenter"] = {
                        config = {
                            zen_mode = "truezen"
                        }
                    },
                    ["core.norg.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes",
                                presentations = "~/presentations"
                            },
                        },
                    },
                },
            }
        end,
        ft = "norg",
        run = ":Neorg sync-parsers",
        after = "nvim-treesitter",
        requires = {
            "nvim-lua/plenary.nvim",
            {
                "Pocco81/true-zen.nvim",
                config = function()
                    require("true-zen").setup {
                        -- your config goes here
                        -- or just leave it empty :)
                    }
                end,
            }
        },
    }
end)
