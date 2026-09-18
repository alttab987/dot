require('plugins.nvim-web-devicons')

vim.pack.add({
	'https://github.com/nvim-lualine/lualine.nvim',
})

local navic = require("nvim-navic")

require('lualine').setup({
	options = {
        icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '|', right = '|'},
		section_separators = { left = '|', right = '|'},
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff'},
		lualine_c = {},
		lualine_x = {'diagnostics'},
		lualine_y = {'fileformat', 'filetype'},
		lualine_z = {'location'},
	},
	winbar = {
		lualine_b = {
			{
				'filename',
				symbols = {
					modified = '●',
				},
			},
		},
		lualine_c = {
			'navic',
			color_correction = nil,
			navic_opts = nil,
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				'filename',
				symbols = {
					modified = '●',
				},
			}
		},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {},
   },
})
