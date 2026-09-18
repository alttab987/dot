vim.pack.add({
	'https://github.com/stevearc/dressing.nvim',
})

require('dressing').setup({
	input = {
		start_mode = 'normal',
	},
	select = {
		telescope = require('telescope.themes').get_dropdown({}),
	},
})
