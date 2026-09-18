vim.pack.add({
	'https://github.com/nvim-mini/mini.snippets',
})

local gen_loader = require('mini.snippets').gen_loader
local lang_patterns = {
	zig = { 'zig.json' },
	odin = { 'odin.json' }
}

require('mini.snippets').setup({
	snippets = {
		-- gen_loader.from_file('~/.config/nvim/snippets/global.json'),
		gen_loader.from_lang({ lang_patterns = lang_patterns }),
	},
})
