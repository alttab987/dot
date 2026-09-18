require('plugins.plenary')

vim.pack.add({
	'https://github.com/nvim-telescope/telescope.nvim',
})

local actions = require('telescope.actions')
local mapn = require('utils').mapn

require('telescope').setup({
	defaults = {
		multi_icon = '',
		initial_mode = 'normal',
	},
	pickers = {
		find_files = {
			theme = 'dropdown',
			mappings = {
				n = {
					['e'] = actions.select_default, 
				},
			},
		},
  		buffers = {
			theme = 'dropdown',
    		mappings = {
				n = {
					['D'] = actions.delete_buffer,
					['e'] = actions.select_default, 
				},
			},
		},
  		help_tags = {
			theme = 'dropdown',
    		mappings = {
				n = { ['e'] = actions.select_vertical, },
			},
		},
		lsp_document_symbols = {
			theme = 'dropdown',
			mappings = {
				n = {
					['e'] = actions.select_default,
				},
			},
		}
	},
})

mapn('<leader>fa', '<cmd>Telescope find_files hidden=true<cr>')
mapn('<leader>ff', '<cmd>Telescope find_files<cr>')
mapn('<leader>fb', '<cmd>Telescope buffers<cr>')
mapn('<leader>fw', '<cmd>Telescope live_grep<cr>')
mapn('<leader>fh', '<cmd>Telescope help_tags<cr>')
mapn('<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>')
mapn('gd', '<cmd>Telescope lsp_definitions<cr>')
mapn('gD', '<cmd>Telescope lsp_references<cr>')
