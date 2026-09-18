vim.pack.add({
	'https://github.com/nvim-mini/mini.starter',
})

local starter = require('mini.starter')
local logo = table.concat({
      '     ███████╗██╗   ██╗ ██████╗██╗  ██╗██╗     ███████╗███████╗███████╗     ',
      '     ██╔════╝██║   ██║██╔════╝██║ ██╔╝██║     ██╔════╝██╔════╝██╔════╝     ',
      '     ███████╗██║   ██║██║     █████╔╝ ██║     █████╗  ███████╗███████╗     ',
      '     ╚════██║██║   ██║██║     ██╔═██╗ ██║     ██╔══╝  ╚════██║╚════██║     ',
      '     ███████║╚██████╔╝╚██████╗██║  ██╗███████╗███████╗███████║███████║     ',
      '     ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝     ',
}, '\n')

starter.setup({
	evaluate_single = true,
	header = logo,
	items = {
		-- starter.sections.sessions(5, true),
	},
	footer = '',
    content_hooks = {
		starter.gen_hook.adding_bullet(),
		starter.gen_hook.aligning('center', 'center'),
    },
})
