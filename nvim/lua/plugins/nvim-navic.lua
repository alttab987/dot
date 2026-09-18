vim.pack.add({
	'https://github.com/SmiteshP/nvim-navic'
})

require('nvim-navic').setup({
	lsp = {
		auto_attach = true,
	},
	highlight = true,
	depth_limit = 0,
	click = false,
})
