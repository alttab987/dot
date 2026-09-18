vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
})

local mapn = require('utils').mapn

vim.diagnostic.config({
	virtual_text = true,
	signs = false,
})

vim.lsp.config['zls'] = {
	root_markers = { 'build.zig' },
}
vim.lsp.enable('zls')
vim.lsp.enable('lua_ls')

mapn('<leader>ih', function()
	if vim.lsp.inlay_hint then
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
	end
end)
