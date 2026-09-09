vim.pack.add {
	'https://github.com/nvim-tree/nvim-web-devicons',
	'https://github.com/prichrd/netrw.nvim',
}

require('nvim-web-devicons').setup {}
require('netrw').setup {}

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'netrw',
	callback = function(event)
		vim.wo.statuscolumn = ''
		vim.wo.signcolumn = 'yes'
		vim.schedule(function()
			if not vim.api.nvim_buf_is_valid(event.buf) or vim.bo[event.buf].filetype ~= 'netrw' then return end
			pcall(require('netrw.ui').embelish, event.buf)
		end)
	end,
})
