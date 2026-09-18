vim.pack.add({
	'https://github.com/nvim-mini/mini.pairs',
})

vim.api.nvim_create_autocmd({'InsertEnter'}, {
	callback = function()
		require('mini.pairs').setup()
	end
})
