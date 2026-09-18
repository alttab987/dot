require('plugins.nui')
require('plugins.nvim-notify')

vim.pack.add({
	'https://github.com/folke/noice.nvim',
})

require('noice').setup()
