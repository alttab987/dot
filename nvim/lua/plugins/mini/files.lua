vim.pack.add(
	{ 'https://github.com/nvim-mini/mini.files' }
)

local utils = require('utils')

require('mini.files').setup({
	mappings = {
		synchronize = '<C-w>',
	};
	options = {
		permanent_delete = true,
	},
})

utils.mapn('<leader>ee', function()
	MiniFiles.open();
end)
