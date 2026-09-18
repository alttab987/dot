local M = {}

function M.mapn(keys, value)
	vim.keymap.set('n', keys, value, { noremap = true })
end

function M.mapi(keys, value)
	vim.keymap.set('i', keys, value, { noremap = true })
end

function M.mapc(keys, value)
	vim.keymap.set('c', keys, value, { noremap = true })
end

-- function M.map_n(keys, value)
-- 	vim.keymap.set('n', keys, value, { noremap = true })
-- end
--
-- function M.map_i(keys, value)
-- 	vim.keymap.set('i', keys, value, { noremap = true })
-- end
--
-- function M.map_c(keys, value)
-- 	vim.keymap.set('c', keys, value, { noremap = true })
-- end

return M
