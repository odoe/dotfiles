return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		lazy = true,
		config = function()
			-- This is where you modify the settings for lsp-zero
			-- Note: autocompletion settings will not take effect

			require('lsp-zero.settings').preset {}
		end,
	},

	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{
				'jay-babu/mason-null-ls.nvim',
				event = { 'BufReadPre', 'BufNewFile' },
				dependencies = {
					'williamboman/mason.nvim',
					'jose-elias-alvarez/null-ls.nvim',
				},
				config = function()
					require('mason-null-ls').setup {
						ensure_installed = { 'stylua', 'prettierd', 'eslint_d' },
					}
					require 'odoenet.plugins.null-ls'
				end,
			},

			-- Autocompletion
			{
				'hrsh7th/nvim-cmp',
				dependencies = {
					'L3MON4D3/LuaSnip',
					config = function()
						require 'odoenet.config.snippets'
					end,
				},
			},
			{ 'hrsh7th/cmp-buffer' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'jose-elias-alvarez/null-ls.nvim' },
			{ 'MunifTanjim/prettier.nvim' },
			{ 'lewis6991/gitsigns.nvim' },

			-- Snippets
			{ 'rafamadriz/friendly-snippets' },
			-- lazy.nvim
			{
				'folke/noice.nvim',
				config = function()
					require('noice').setup {
						lsp = {
							hover = {
								enabled = false,
							},
							signature = {
								enabled = false,
							},
							-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
							override = {
								['vim.lsp.util.convert_input_to_markdown_lines'] = true,
								['vim.lsp.util.stylize_markdown'] = true,
								['cmp.entry.get_documentation'] = true,
							},
						},
						-- you can enable a preset for easier configuration
						presets = {
							bottom_search = false, -- use a classic bottom cmdline for search
							-- command_palette = true, -- position the cmdline and popupmenu together
							long_message_to_split = true, -- long messages will be sent to a split
							inc_rename = true, -- enables an input dialog for inc-rename.nvim
							lsp_doc_border = true, -- add a border to hover docs and signature help
						},
					}
					require("notify").setup({
						background_colour = "#000000",
					})
				end,
				event = 'VeryLazy',
				dependencies = {
					-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
					'MunifTanjim/nui.nvim',
					-- OPTIONAL:
					--   `nvim-notify` is only needed, if you want to use the notification view.
					--   If not available, we use `mini` as the fallback
					'rcarriga/nvim-notify',
				},
			},
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			-- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
			-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

			require('lsp-zero.cmp').extend()

			-- And you can configure cmp even more, if you want to.
			local cmp = require 'cmp'
			local cmp_action = require('lsp-zero.cmp').action()

			cmp.setup {
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert {
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					-- { name = 'vsnip' }, -- For vsnip users.
					{ name = 'luasnip' }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {
					{ name = 'buffer' },
				}),
			}

			-- Set configuration for specific filetype.
			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
				}, {
					{ name = 'buffer' },
				}),
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' },
				},
			})
		end,
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = 'LspInfo',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
		},
		config = function()
			-- This is where all the LSP shenanigans will live

			local lsp = require 'lsp-zero'

			lsp.preset 'recommended'

			lsp.ensure_installed {
				'tsserver',
				'eslint',
				'lua_ls',
				'rust_analyzer',
			}

			lsp.configure('lua_ls', {
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' },
						},
					},
				},
			})

			lsp.set_preferences {
				suggest_lsp_servers = false,
				sign_icons = {
					error = 'E',
					warn = 'W',
					hint = 'H',
					info = 'I',
				},
			}

			lsp.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }

				-- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
				vim.keymap.set('n', 'K', function()
					vim.lsp.buf.hover()
				end, opts)
				vim.keymap.set('n', '<leader>vws', function()
					vim.lsp.buf.workspace_symbol()
				end, opts)
				vim.keymap.set('n', '<leader>vd', function()
					vim.diagnostic.open_float()
				end, opts)
				vim.keymap.set('n', '[d', function()
					vim.diagnostic.goto_next()
				end, opts)
				vim.keymap.set('n', ']d', function()
					vim.diagnostic.goto_prev()
				end, opts)
				vim.keymap.set('n', '<leader>vca', function()
					vim.lsp.buf.code_action()
				end, opts)
				vim.keymap.set('n', '<leader>vrr', function()
					vim.lsp.buf.references()
				end, opts)
				vim.keymap.set('n', '<leader>vrn', function()
					vim.lsp.buf.rename()
				end, opts)
				vim.keymap.set('i', '<C-h>', function()
					vim.lsp.buf.signature_help()
				end, opts)
			end)

			lsp.configure('tsserver', {
				single_file_support = false,
				root_dir = require('lspconfig.util').root_pattern 'package.json',
			})

			lsp.configure('denols', {
				single_file_support = false,
				root_dir = require('lspconfig.util').root_pattern 'deno.json',
			})

			lsp.nvim_workspace()

			lsp.setup()
		end,
	},
}
