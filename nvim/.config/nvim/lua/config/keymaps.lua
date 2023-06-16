local opts = { noremap = true, silent = true }

-- vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- copy everything between { and } including brackets --

vim.keymap.set('n', 'YY', 'va{Vy', opts)

-- greatest remap ever
vim.keymap.set('x', '<leader>p', '"_dP')

-- next greatest remap ever : asbjornHaland
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
vim.keymap.set('n', '<leader>f', function(_, bufnr)
	vim.lsp.buf.format()
end)
vim.keymap.set('n', '<leader>py', function(_, bufnr)
	vim.lsp.buf.format {
		timeout_ms = 5000,
		bufnr = bufnr,
		filter = function(_client)
			return _client.name == 'null-ls'
		end,
	}
end)

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- Window navigation
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-l>', '<C-l>h', opts)

-- Floaterm
vim.keymap.set('n', '<leader>gg', '<cmd>FloatermNew lazygit<CR>')

-- Fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
