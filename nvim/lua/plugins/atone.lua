vim.pack.add(
	{ 'https://github.com/XXiaoA/atone.nvim' }
)

local utils = require('utils')

vim.api.nvim_create_autocmd({'InsertEnter'}, {
	callback = function()
		require('atone').setup({
			keymaps = {
				tree = {
					undo_to = 'e',
				},
			},
			ui = {
				border = 'rounded',
			},
		})
	end
})

utils.mapn('<leader>ut', '<cmd>Atone open<cr>')
