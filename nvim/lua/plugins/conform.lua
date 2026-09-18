vim.pack.add(
	{ 'https://github.com/stevearc/conform.nvim' }
)

require('conform').setup({
	formatters_by_ft = {
		zig = { 'zigfmt' },
	},
	formatters = {
		zigfmt = {
			command = 'zig',
			args = { 'fmt', '--stdin' },
		},
	},
})

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	callback = function(args)
		require('conform').format({ bufnr = args.buf })
	end,
})
