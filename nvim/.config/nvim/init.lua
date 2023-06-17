vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'config.keymaps'
require 'config.options'

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
			require 'odoenet.config.telescope'
		end,
	},

	-- Themes
	{ 'Mofiqul/dracula.nvim',    name = 'dracula' },
	'folke/tokyonight.nvim',
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		config = function()
			vim.cmd 'colorscheme catppuccin'
			vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
		end,
	},
	{
		'challenger-deep-theme/vim',
	},
	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-neorg/neorg',
		},
		config = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
			require 'odoenet.config.treesitter'
		end,
	},

	'nvim-treesitter/nvim-treesitter-context',
	'nvim-treesitter/playground',
	{
		'theprimeagen/harpoon',
		config = function()
			require 'odoenet.config.harpoon'
		end,
	},
	'mbbill/undotree',

	{
		'laytan/cloak.nvim',
		config = function()
			require('cloak').setup {
				enabled = true,
				cloak_character = '*',
				-- The applied highlight group (colors) on the cloaking, see `:h highlight`.
				highlight_group = 'Comment',
				-- Applies the length of the replacement characters for all matched
				-- patterns, defaults to the length of the matched pattern.
				cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
				patterns = {
					{
						-- Match any file starting with '.env'.
						-- This can be a table to match multiple file patterns.
						file_pattern = '.env*',
						-- Match an equals sign and any character after it.
						-- This can also be a table of patterns to cloak,
						-- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
						cloak_pattern = '=.+',
					},
				},
			}
		end,
	},

	'tpope/vim-fugitive',
	'voldikss/vim-floaterm',
	'tpope/vim-commentary',

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},

	-- {
	--     'nvim-tree/nvim-tree.lua',
	--     dependencies = {
	--         'nvim-tree/nvim-web-devicons', -- optional, for file icons
	--     },
	--     tag = 'nightly' -- optional, updated every week. (see issue #1193)
	-- }

	'nvim-tree/nvim-web-devicons', -- optional, for file icons

	{
		'glepnir/lspsaga.nvim',
		branch = 'main',
		config = function()
			require('lspsaga').setup {}
			require 'odoenet.config.lspsaga'
		end,
		dependencies = {
			{ 'nvim-tree/nvim-web-devicons' },
			--Please make sure you install markdown and markdown_inline parser
			{ 'nvim-treesitter/nvim-treesitter' },
		},
	},

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
		config = function()
			require('nvim-autopairs').setup {}
		end,
	},

	'p00f/nvim-ts-rainbow',

	{
		'nvim-neorg/neorg',
		config = function()
			require('neorg').setup {
				load = {
					['core.defaults'] = {}, -- Loads default behaviour
					['core.concealer'] = {}, -- Adds pretty icons to your documents
					['core.presenter'] = {
						config = {
							zen_mode = 'zen-mode',
						},
					},
					['core.dirman'] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = '~/notes',
								presentations = '~/presentations',
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
			},
		},
	},

	{ import = 'odoenet.plugins' },
}

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

require('lazy').setup(plugins, {})

require('nvim-web-devicons').setup {
	color_icons = true,
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true,
}
