vim.pack.add({
	'https://github.com/saghen/blink.lib',
	'https://github.com/saghen/blink.cmp',
})

local cmp = require('blink.cmp')

cmp.build():pwait()
vim.api.nvim_create_autocmd({'InsertEnter'}, {
	callback = function()
		cmp.setup({
			keymap = {
				preset = 'default',
				['<C-n>'] = { 'select_and_accept' },
				['<C-j>'] = { 'select_next' },
				['<C-k>'] = { 'select_prev' },
			},
			completion = {
				menu = { border = 'rounded' },
				documentation = {
					auto_show = false,
					window = { border = 'rounded' },
				},
			},
			signature = { window = { border = 'rounded' } },
			snippets = { preset = 'mini_snippets' },
			sources = { default = { 'snippets', 'lsp', 'path', 'buffer' } },
		})
	end
})
