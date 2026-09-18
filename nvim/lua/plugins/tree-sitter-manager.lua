vim.pack.add({
	'https://github.com/romus204/tree-sitter-manager.nvim',
})

require('tree-sitter-manager').setup({
	ensure_installed = { 'zig', 'odin', 'scheme', 'bash', 'regex', 'markdown_inline', 'markdown'},
})
