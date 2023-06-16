local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
return {
	'jose-elias-alvarez/null-ls.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = { 'mason.nvim' },
	opts = function()
		local null_ls = require 'null-ls'
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions
		local completion = null_ls.builtins.completion
		return {
			sources = {
				formatting.stylua,
				formatting.prettierd,
				formatting.eslint_d,
				diagnostics.eslint_d,
				-- diagnostics.tsc,
				code_actions.eslint_d,
				code_actions.gitsigns,
				completion.spell,
			},
		}
	end,
	on_attach = function(client, bufnr)
		-- Enable formatting on sync
		if client.supports_method 'textDocument/formatting' then
			vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					vim.lsp.buf.formatting_sync {
						bufnr = bufnr,
						filter = function(_client)
							return _client.name == 'null-ls'
						end,
					}
				end,
			})
			-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			-- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			--     group = augroup,
			--     buffer = bufnr,
			--     callback = function()
			--         -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
			--         -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
			--         vim.lsp.buf.format({ timeout_ms = 5000 })
			--     end,
			-- })

			-- local format_on_save = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
			-- vim.api.nvim_create_autocmd('BufWritePre', {
			--     group = format_on_save,
			--     buffer = bufnr,
			--     callback = function()
			--         vim.lsp.buf.format({
			--             bufnr = bufnr,
			--             filter = function(_client)
			--                 return _client.name == "null-ls"
			--             end
			--         })
			--     end,
			-- })
		end
	end,
}
